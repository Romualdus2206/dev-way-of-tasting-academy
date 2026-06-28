import { BrowserRouter, Navigate, Route, Routes, useLocation, useParams } from 'react-router-dom';
import { AppLayout } from './components/AppLayout';
import { RequireAuth } from './components/RequireAuth';
import { ACADEMY_HOME, lessonPath, quizPath } from './navigation';
import { DrankPage } from './pages/DrankPage';
import { LessonDetailPage } from './pages/LessonDetailPage';
import { LoginPage } from './pages/LoginPage';
import { ProfielPage } from './pages/ProfielPage';
import { QuizPage } from './pages/QuizPage';

function LegacyPortLessonRedirect() {
  const { lessonId } = useParams<{ lessonId: string }>();
  if (!lessonId) return <Navigate to={ACADEMY_HOME} replace />;
  return <Navigate to={lessonPath('port', lessonId)} replace />;
}

function LegacyPortQuizRedirect() {
  const { lessonId } = useParams<{ lessonId: string }>();
  if (!lessonId) return <Navigate to={ACADEMY_HOME} replace />;
  return <Navigate to={quizPath('port', lessonId)} replace />;
}

function LegacyDrankRedirect() {
  const { pathname } = useLocation();
  return <Navigate to={pathname.replace(/^\/drank/, '/academy')} replace />;
}

export function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route element={<RequireAuth />}>
          <Route element={<AppLayout />}>
            <Route path="/" element={<Navigate to={ACADEMY_HOME} replace />} />
            <Route path="/academy" element={<DrankPage />} />
            <Route path="/academy/:category" element={<DrankPage />} />
            <Route path="/academy/:category/lessons/:lessonId" element={<LessonDetailPage />} />
            <Route path="/academy/:category/lessons/:lessonId/quiz" element={<QuizPage />} />
            <Route path="/drank/*" element={<LegacyDrankRedirect />} />
            <Route path="/profiel" element={<ProfielPage />} />
            <Route path="/lessons/:lessonId" element={<LegacyPortLessonRedirect />} />
            <Route path="/lessons/:lessonId/quiz" element={<LegacyPortQuizRedirect />} />
          </Route>
        </Route>
        <Route path="*" element={<Navigate to={ACADEMY_HOME} replace />} />
      </Routes>
    </BrowserRouter>
  );
}
