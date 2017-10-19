import React, { Component } from 'react';
import { Switch, Route } from 'react-router-dom';
import HomePage from '../containers/homePage';
import BlockingPage from '../containers/blockingPage';
import SchedulePage from '../containers/schedulePage';
import StageDirectionsPage from '../containers/stageDirectionsPage';
import LightsPage from '../containers/stageCrewPage/lightsPage';
import SoundPage from '../containers/stageCrewPage/soundPage';
import ScriptPage from '../containers/scriptPage';
import ActorBlockingPage from '../containers/actorPage/actorBlockingPage'
import ActorLinesPage from '../containers/actorPage/actorLinesPage'
import SMPropertyNotesPage from '../containers/stageManagerPage/propertyNotesPage';
import ManagerSchedulePage from '../containers/stageManagerPage/schedulePage';
import APropertyNotesPage from '../containers/actorPage/propertyNotesPage';
import ManageCrewPage from '../containers/directorPage/manageCrewPage';
import BlockingDecisionsPage from '../containers/directorPage/blockingDecisionsPage';

/* Above, we're importing all the components we made for the different pages. Make sure their filepaths
are correct. Filepaths are relative to the file you're currently in. Curly braces are used when you're
importing named exports under a default export. E.g. React is a default export, and { Component } is a
named export under React. */
class Routes extends Component {

    render() {
        return (
            <Switch>
                {/* These routes contain the path (URL) we want to lead to the component we want to
                    display. Paths should have intuitive names. */}
                <Route exact path='/' component={HomePage} />
                <Route path='/blocking' component={BlockingPage} />
                <Route path='/schedule' component={SchedulePage} />
                <Route path='/stage-directions' component={StageDirectionsPage} />
                {/* Below is an example of a sub-route. */}
                <Route path='/stage-crew/lights' component={LightsPage} />
                <Route path='/stage-crew/sound' component={SoundPage} />
                <Route path='/script' component={ScriptPage} />
                <Route path='/stage-manager/property-notes' component={SMPropertyNotesPage} />
                <Route path='/stage-manager/schedule' component={ManagerSchedulePage} />
                <Route path='/actor/property-notes' component={APropertyNotesPage} />
                <Route path='/actor/blocking' component={ActorBlockingPage} />
                <Route path='/actor/lines' component={ActorLinesPage} />
                <Route path='/director/manage-crew' component={ManageCrewPage} />
                <Route path='/director/blocking-decisions' component={BlockingDecisionsPage} />
            </Switch>
        )
    }

}

export default Routes;
