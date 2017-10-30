import React, { Component } from 'react';
import Menu from '../containers/menu';
import Routes from './routes';

class App extends Component {

    render() {
        return (
            <div>
                {/* <Menu /> is an imported React Component, so instead of cluttering up this file
                    with all the code for the navigation bar, we keep this file neat and tidy. */}
                <Menu />

                {/* <Routes /> is also a React Component containing the routes and components to all
                    our different pages. Components can be called anything, but they should have intuitive
                    names. */}
                <div className="main"><Routes /></div>
            </div>
        );
    }
}

export default App;
