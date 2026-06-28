import { NavLink, Outlet, useLocation } from 'react-router-dom';
import { APP_VERSION } from '@way-of-tasting/academy-shared';
import {
  ACADEMY_HOME,
  BEVERAGE_CATEGORIES,
  findAcademyCategoryGroup,
  isBeverageCategory,
  type AppTab,
} from '../navigation';
import { config } from '../config';

const TABS: AppTab[] = [
  { id: 'drank', label: 'Drank', icon: '🍷', href: '/drank', external: true },
  { id: 'proeverij', label: 'Proeverij', icon: '🥂', href: '/proeverij', disabled: true },
  { id: 'pairing', label: 'Pairing', icon: '🍽', href: '/pairing', disabled: true },
  { id: 'scan', label: 'Scan', icon: '📷', href: '/scan', disabled: true },
  { id: 'academy', label: 'Academy', icon: '🎓', href: ACADEMY_HOME },
  { id: 'moment', label: 'Moment', icon: '🌙', href: '/moment', external: true },
];

function academyPath(pathname: string): string {
  return pathname.startsWith('/academy') ? pathname : pathname.replace(/^\/drank/, '/academy');
}

function headerSubtitle(pathname: string): string {
  const path = academyPath(pathname);
  if (path.startsWith('/profiel')) return 'Profiel';

  const categoryMatch = path.match(/^\/academy\/([^/]+)/);
  const category = categoryMatch?.[1];
  if (category && isBeverageCategory(category)) {
    const meta = BEVERAGE_CATEGORIES.find((item) => item.id === category);
    const group = findAcademyCategoryGroup(category);
    if (path.includes('/lessons/')) {
      return `Academy · ${meta?.label ?? category}`;
    }
    return `Academy · ${group?.label ?? meta?.label ?? 'Opleidingen'}`;
  }

  if (path.startsWith('/academy')) return 'Academy';
  return 'Academy';
}

function isTabActive(tab: AppTab, pathname: string): boolean {
  const path = academyPath(pathname);
  if (tab.id === 'academy') return path.startsWith('/academy');
  return false;
}

function externalTabHref(tab: AppTab): string {
  if (tab.id === 'drank') return `${config.kelderAppUrl}${tab.href}`;
  if (tab.id === 'moment') return `${config.momentAppUrl}${tab.href}`;
  return tab.href;
}

export function AppLayout() {
  const { pathname } = useLocation();
  const sub = headerSubtitle(pathname);
  const profielActive = pathname.startsWith('/profiel');

  return (
    <div className="app-shell">
      <div className="app-shell-header">
        <header className="topbar">
          <img
            src="/logo-way-of-tasting.png"
            alt=""
            className="topbar-logo"
            width={48}
            height={48}
          />
          <div className="topbar-body">
            <h1>Way of tasting</h1>
            <div className="topbar-meta">
              <span className="topbar-meta-item topbar-sub">{sub}</span>
              <span className="topbar-meta-item topbar-version">v{APP_VERSION} · Academy</span>
              <NavLink
                to="/profiel"
                className={`topbar-meta-item topbar-profile-link${profielActive ? ' active' : ''}`}
              >
                <span className="topbar-profile-icon" aria-hidden="true">
                  👤
                </span>
                <span className="topbar-profile-label">Profiel</span>
              </NavLink>
            </div>
          </div>
        </header>
        <nav className="tabbar" aria-label="Hoofdnavigatie">
          {TABS.map((tab) => {
            if (tab.disabled) {
              return (
                <span
                  key={tab.id}
                  className="tabbar-link tabbar-link--disabled"
                  aria-disabled="true"
                  title="Binnenkort beschikbaar"
                >
                  <span className="tabbar-icon">{tab.icon}</span>
                  {tab.label}
                </span>
              );
            }

            if (tab.external) {
              return (
                <a key={tab.id} href={externalTabHref(tab)} className="tabbar-link">
                  <span className="tabbar-icon">{tab.icon}</span>
                  {tab.label}
                </a>
              );
            }

            return (
              <NavLink
                key={tab.id}
                to={tab.href}
                className={({ isActive }) =>
                  `tabbar-link${isActive || isTabActive(tab, pathname) ? ' active' : ''}`
                }
              >
                <span className="tabbar-icon">{tab.icon}</span>
                {tab.label}
              </NavLink>
            );
          })}
        </nav>
      </div>
      <main className="main">
        <Outlet />
      </main>
    </div>
  );
}
