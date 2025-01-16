// React with TypeScript for a more interactive and feature-rich U

import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Borrow from './components/Borrow';
import Lend from './components/Lend';
import Dashboard from './components/Dashboard';
import Governance from './components/Governance';
import Analytics from './components/Analytics';

const App: React.FC = () => (
  <Router>
    <Switch>
      <Route path="/borrow" component={Borrow} />
      <Route path="/lend" component={Lend} />
      <Route path="/governance" component={Governance} />
      <Route path="/analytics" component={Analytics} />
      <Route path="/" component={Dashboard} />
    </Switch>
  </Router>
);

export default App;
