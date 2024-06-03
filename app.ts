// File: src/app.ts
import express, { Request, Response, NextFunction } from 'express';
import bodyParser from 'body-parser';
import { Pool } from 'pg';

const app = express();
const PORT = 8080;

// Middleware
app.use(bodyParser.json());

// PostgreSQL connection pool
const pool = new Pool({
  user: 'postgres',
  host: 'db',
  database: 'postgres',
  password: 'password',
  port: 5432,
});

// Routes
app.post('/users', async (req: Request, res: Response, next: NextFunction) => {
  try {
    // Implementation for creating a user
  } catch (error) {
    next(error);
  }
});

app.patch('/users/:userId', async (req: Request, res: Response, next: NextFunction) => {
  try {
    // Implementation for updating a user
  } catch (error) {
    next(error);
  }
});

app.delete('/users/:userId', async (req: Request, res: Response, next: NextFunction) => {
  try {
    // Implementation for deleting a user
  } catch (error) {
    next(error);
  }
});

app.post('/users/:userId/songs/:songId', async (req: Request, res: Response, next: NextFunction) => {
  try {
    // Implementation for adding a song to user's favorites
  } catch (error) {
    next(error);
  }
});

app.delete('/users/:userId/songs/:songId', async (req: Request, res: Response, next: NextFunction) => {
  try {
    // Implementation for removing a song from user's favorites
  } catch (error) {
    next(error);
  }
});

app.get('/users/:userId/songs', async (req: Request, res: Response, next: NextFunction) => {
  try {
    // Implementation for getting user's favorite songs
  } catch (error) {
    next(error);
  }
});

// Error handling middleware
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
