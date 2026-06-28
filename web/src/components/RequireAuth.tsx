import { Navigate, Outlet } from 'react-router-dom';
import { useSession } from '../hooks/useSession';

export function RequireAuth() {
  const { session, loading } = useSession();

  if (loading) {
    return <div className="shell muted">Laden…</div>;
  }

  if (!session) {
    return <Navigate to="/login" replace />;
  }

  return <Outlet />;
}
