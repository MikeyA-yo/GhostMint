import { createFileRoute } from '@tanstack/react-router';
import { ExplorePage } from '@/components/explore';

export const Route = createFileRoute('/explore')({
  component: ExplorePage,
});