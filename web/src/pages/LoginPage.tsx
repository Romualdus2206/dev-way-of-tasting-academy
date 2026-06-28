import React from 'react';
import { Navigate } from 'react-router-dom';
import { getSupabaseAuth } from '../lib/supabase';
import { ACADEMY_HOME } from '../navigation';
import { useSession } from '../hooks/useSession';

export function LoginPage() {
  const { session, loading } = useSession();
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [error, setError] = React.useState<string | null>(null);

  if (loading) {
    return (
      <div className="login-shell">
        <p className="muted">Laden…</p>
      </div>
    );
  }

  if (session) {
    return <Navigate to={ACADEMY_HOME} replace />;
  }

  async function login(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    const { error: err } = await getSupabaseAuth().auth.signInWithPassword({ email, password });
    if (err) setError(err.message);
  }

  return (
    <div className="login-shell">
      <header className="login-brand">
        <img
          src="/logo-way-of-tasting.png"
          alt=""
          className="login-logo"
          width={72}
          height={72}
        />
        <h1>Way of tasting</h1>
        <p className="muted">Academy — Port track</p>
      </header>
      <main className="card login-card">
        <h2 className="section">Inloggen</h2>
        <p className="muted">Zelfde account als Way of tasting (kelder).</p>
        <form onSubmit={(e) => void login(e)} className="form">
          <label>
            E-mail
            <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
          </label>
          <label>
            Wachtwoord
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </label>
          {error ? <p className="err">{error}</p> : null}
          <button type="submit">Inloggen</button>
        </form>
      </main>
    </div>
  );
}
