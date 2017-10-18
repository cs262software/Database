import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class Menu extends Component {

    render() {
        return (
            <div>
                <nav className="navbar navbar-inverse navbar-static-top">
                	<div className="container">

                		<div className="navbar-header">
                			<a className="navbar-brand" href="#">Theatre Software Suite</a>
                		</div>

                		<div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                        	<ul className="nav navbar-nav navbar-right">
                                <li className="dropdown">
                					<a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">General<span className="caret"></span></a>
                					<ul className="dropdown-menu">
                                        <li><Link to='/blocking'>Blocking</Link></li>
                                        <li><Link to='/schedule'>Schedule</Link></li>
                                        <li><Link to='/stage-directions'>Stage Directions</Link></li>
                                        <li><Link to='/script'>Scripts</Link></li>
                					</ul>
                				</li>
                                <li className="dropdown">
                					<a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Stage Crew<span className="caret"></span></a>
                					<ul className="dropdown-menu">
                                        <li><Link to='/stage-crew/lights'>Lights</Link></li>
                                        <li><Link to='/stage-crew/sound'>Sound</Link></li>
                					</ul>
                				</li>
                                <li className="dropdown">
                					<a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Stage Manager<span className="caret"></span></a>
                					<ul className="dropdown-menu">
                                        <li><Link to='/stage-manager/property-notes'>Property Notes</Link></li>
                                        <li><Link to='/stage-manager/schedule'>Schedule</Link></li>
                					</ul>
                				</li>
                			</ul>

                		</div>

                	</div>
                </nav>

            </div>
        );
    }

}

export default Menu;
