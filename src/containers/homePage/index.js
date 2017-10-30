import React, { Component } from 'react';

// This is a React component called 'HomePage'
class HomePage extends Component {

    // render() returns any HTML content we tell it to, rendering it on the webpage
    render() {
        return (
            <div>
                <h1>Home Page</h1>
            </div>
        );
    }

}

// 'export' allows us to import and use HomePage as a component, for example, in routes.js 
export default HomePage;
