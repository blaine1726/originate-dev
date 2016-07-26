// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require react
//= require react_ujs
//= require three
//= require canvasrenderer
//= require projector
//= require bird

//Ideally should just have require components


(function($) {

  /**
   * Copyright 2012, Digital Fusion
   * Licensed under the MIT license.
   * http://teamdf.com/jquery-plugins/license/
   *
   * @author Sam Sehnert
   * @desc A small plugin that checks whether elements are within
   *     the user visible viewport of a web browser.
   *     only accounts for vertical position, not horizontal.
   */

  $.fn.visible = function(partial) {

      var $t            = $(this),
          $w            = $(window),
          viewTop       = $w.scrollTop(),
          viewBottom    = viewTop + $w.height() - 140,
          _top          = $t.offset().top,
          _bottom       = _top + $t.height(),
          compareTop    = partial === true ? _bottom : _top,
          compareBottom = partial === true ? _top : _bottom;

    return ((compareBottom <= viewBottom) && (compareTop >= viewTop));

  };

})(jQuery);

function setVisible(el) {
  var el = $(el);
  if (el.visible(true)) {
    el.addClass('visible');
  }
}

function setAnimation() {
  $('.animate').each(function(i, el) {
    setVisible(el);
  });
}

window.setAnimation = setAnimation;

function setScrollTop() {
  $(document).scrollTop(0);
}

// Set the scroll height to the top upon a page reload
// Ensures that the animations still look good
// $(window).bind('beforeunload',function(){
//     $(document).scrollTop(0);
// });



$(window).scroll(function(event) {
  //Animate the tiles moving in
  $(".animate").each(function(i, el) {
    var el = $(el);
    if (el.visible(true) && !el.hasClass('visible')) {
      el.addClass("slide-up");
    }
  });

});

$(document).ready(function() {
  var $w = $(window);
  $('.parallax__layer--back').each(function() {
    if ($w.scrollTop() == $(this).top) {
    }
  });
});

var sphereDirection = 1;

//Three.js home page
window.onload = function() {
  var SCREEN_WIDTH = window.innerWidth,
      SCREEN_HEIGHT = window.innerHeight;
  if (document.getElementById('home-animation')) {
    var mouseX = 0, mouseY = 0,
    			windowHalfX = window.innerWidth / 2,
    			windowHalfY = window.innerHeight / 2,
    			SEPARATION = 200,
    			AMOUNTX = 10,
    			AMOUNTY = 10,
    			sphereCamera, sphereScene, sphereRenderer;
  	initSphere();
  	animateSphere();
    var zDist = 2000
    function initSphere() {
    	var container, separation = 100, amountX = 50, amountY = 50,
    	particles, particle;
    	container = document.createElement('div');
    	document.getElementById('home-animation').appendChild(container);
    	sphereCamera = new THREE.PerspectiveCamera( 75, SCREEN_WIDTH / SCREEN_HEIGHT, 1, 10000 );
    	sphereCamera.position.z = 500;
    	sphereScene = new THREE.Scene();
    	sphereRenderer = new THREE.CanvasRenderer();
    	sphereRenderer.setPixelRatio( window.devicePixelRatio );
    	sphereRenderer.setSize( SCREEN_WIDTH, SCREEN_HEIGHT );
      container.appendChild( sphereRenderer.domElement );
    	// particles
    	var PI2 = Math.PI * 2;
    	var material = new THREE.SpriteCanvasMaterial( {
    		color: 0xffffff,
    		program: function ( context ) {
    			context.beginPath();
    			context.arc( 0, 0, 0.5, 0, PI2, true );
    			context.fill();
    		}
    	} );
    	for ( var i = 0; i < 1000; i ++ ) {
    		particle = new THREE.Sprite( material );
    		particle.position.x = Math.random() * 2 - 1;
    		particle.position.y = Math.random() * 2 - 1;
    		particle.position.z = Math.random() * 2 - 1;
    		particle.position.normalize();
    		particle.position.multiplyScalar( Math.random() * 10 + 450 );
    		particle.scale.multiplyScalar( 2 );
    		sphereScene.add( particle );
    	}
    	// lines
    	for (var i = 0; i < 300; i++) {
    		var geometry = new THREE.Geometry();
    		var vertex = new THREE.Vector3( Math.random() * 2 - 1, Math.random() * 2 - 1, Math.random() * 2 - 1 );
    		vertex.normalize();
    		vertex.multiplyScalar( 450 );
    		geometry.vertices.push( vertex );
    		var vertex2 = vertex.clone();
    		vertex2.multiplyScalar( Math.random() * 0.3 + 1 );
    		geometry.vertices.push( vertex2 );
    		var line = new THREE.Line( geometry, new THREE.LineBasicMaterial( { color: 0xffffff, opacity: Math.random() } ) );
    		sphereScene.add( line );
    	}
    	document.addEventListener( 'mousemove', onDocumentMouseMoveSphere, false );
    	document.addEventListener( 'touchstart', onDocumentTouchStartSphere, false );
    	document.addEventListener( 'touchmove', onDocumentTouchMoveSphere, false );
    	//
    	window.addEventListener( 'resize', onWindowResizeSphere, false );
    }
    function onWindowResizeSphere() {
    	windowHalfX = window.innerWidth / 2;
    	windowHalfY = window.innerHeight / 2;
    	sphereCamera.aspect = window.innerWidth / window.innerHeight;
    	sphereCamera.updateProjectionMatrix();
    	sphereRenderer.setSize( window.innerWidth, window.innerHeight );
    }
    //
    function onDocumentMouseMoveSphere(event) {
    	mouseX = event.clientX - windowHalfX;
    	mouseY = event.clientY - windowHalfY;
    }
    function onDocumentTouchStartSphere( event ) {
    	if ( event.touches.length > 1 ) {
    		event.preventDefault();
    		mouseX = event.touches[ 0 ].pageX - windowHalfX;
    		mouseY = event.touches[ 0 ].pageY - windowHalfY;
    	}
    }
    function onDocumentTouchMoveSphere( event ) {
    	if ( event.touches.length == 1 ) {
    		event.preventDefault();
    		mouseX = event.touches[ 0 ].pageX - windowHalfX;
    		mouseY = event.touches[ 0 ].pageY - windowHalfY;
    	}
    }
    //
    function animateSphere() {
    	requestAnimationFrame( animateSphere );
    	renderSphere();
    }
    function renderSphere() {
    	sphereCamera.position.x += ( mouseX - sphereCamera.position.x ) * .05;
    	sphereCamera.position.y += ( - mouseY + 200 - sphereCamera.position.y ) * .05;
      // scene.position.y += 5
      if (sphereCamera.position.z <= 100) {
        sphereDirection = 0;
      }
      if (sphereDirection == 1) {
        if (sphereCamera.position.z > 100) {
          if (sphereCamera.position.z > 500) {
            sphereCamera.position.z -= 5;
          } else if (sphereCamera.position.z > 250) {
            sphereCamera.position.z -= 3;
          } else {
            sphereCamera.position.z -= .5;
          }
        }
      }
      if (sphereDirection == 0) {
        if (sphereCamera.position.z < 500) {
          sphereCamera.position.z += .5
        } else {
          sphereDirection = 1;
        }
      }
      // sphereScene.position.x = 0
      // scene.position.y = 0
      // scene.position.z = 0
    	sphereCamera.lookAt( sphereScene.position );
      // camera.position.x += .2
      // // camera.position.z -= .5
    	sphereRenderer.render( sphereScene, sphereCamera );
    }
  }

  var Boid = function() {
  	var vector = new THREE.Vector3(),
  	_acceleration, _width = 500, _height = 500, _depth = 200, _goal, _neighborhoodRadius = 100,
  	_maxSpeed = 4, _maxSteerForce = 0.1, _avoidWalls = false;
  	this.position = new THREE.Vector3();
  	this.velocity = new THREE.Vector3();
  	_acceleration = new THREE.Vector3();
  	this.setGoal = function ( target ) {
  		_goal = target;
  	};
  	this.setAvoidWalls = function ( value ) {
  		_avoidWalls = value;
  	};
  	this.setWorldSize = function ( width, height, depth ) {
  		_width = width;
  		_height = height;
  		_depth = depth;
  	};
  	this.run = function ( boids ) {
  		if ( _avoidWalls ) {
  			vector.set( - _width, this.position.y, this.position.z );
  			vector = this.avoid( vector );
  			vector.multiplyScalar( 5 );
  			_acceleration.add( vector );
  			vector.set( _width, this.position.y, this.position.z );
  			vector = this.avoid( vector );
  			vector.multiplyScalar( 5 );
  			_acceleration.add( vector );
  			vector.set( this.position.x, - _height, this.position.z );
  			vector = this.avoid( vector );
  			vector.multiplyScalar( 5 );
  			_acceleration.add( vector );
  			vector.set( this.position.x, _height, this.position.z );
  			vector = this.avoid( vector );
  			vector.multiplyScalar( 5 );
  			_acceleration.add( vector );
  			vector.set( this.position.x, this.position.y, - _depth );
  			vector = this.avoid( vector );
  			vector.multiplyScalar( 5 );
  			_acceleration.add( vector );
  			vector.set( this.position.x, this.position.y, _depth );
  			vector = this.avoid( vector );
  			vector.multiplyScalar( 5 );
  			_acceleration.add( vector );
  		}/* else {
  			this.checkBounds();
  		}
  		*/
  		if ( Math.random() > 0.5 ) {
  			this.flock( boids );
  		}
  		this.move();
  	};
  	this.flock = function ( boids ) {
  		if ( _goal ) {
  			_acceleration.add( this.reach( _goal, 0.005 ) );
  		}
  		_acceleration.add( this.alignment( boids ) );
  		_acceleration.add( this.cohesion( boids ) );
  		_acceleration.add( this.separation( boids ) );
  	};
  	this.move = function () {
  		this.velocity.add( _acceleration );
  		var l = this.velocity.length();
  		if ( l > _maxSpeed ) {
  			this.velocity.divideScalar( l / _maxSpeed );
  		}
  		this.position.add( this.velocity );
  		_acceleration.set( 0, 0, 0 );
  	};
  	this.checkBounds = function () {
  		if ( this.position.x >   _width ) this.position.x = - _width;
  		if ( this.position.x < - _width ) this.position.x =   _width;
  		if ( this.position.y >   _height ) this.position.y = - _height;
  		if ( this.position.y < - _height ) this.position.y =  _height;
  		if ( this.position.z >  _depth ) this.position.z = - _depth;
  		if ( this.position.z < - _depth ) this.position.z =  _depth;
  	};
  	//
  	this.avoid = function ( target ) {
  		var steer = new THREE.Vector3();
  		steer.copy( this.position );
  		steer.sub( target );
  		steer.multiplyScalar( 1 / this.position.distanceToSquared( target ) );
  		return steer;
  	};
  	this.repulse = function ( target ) {
  		var distance = this.position.distanceTo( target );
  		if ( distance < 150 ) {
  			var steer = new THREE.Vector3();
  			steer.subVectors( this.position, target );
  			steer.multiplyScalar( 0.5 / distance );
  			_acceleration.add( steer );
  		}
  	};
  	this.reach = function ( target, amount ) {
  		var steer = new THREE.Vector3();
  		steer.subVectors( target, this.position );
  		steer.multiplyScalar( amount );
  		return steer;
  	};
  	this.alignment = function ( boids ) {
  		var boid, velSum = new THREE.Vector3(),
  		count = 0;
  		for ( var i = 0, il = boids.length; i < il; i++ ) {
  			if ( Math.random() > 0.6 ) continue;
  			boid = boids[ i ];
  			distance = boid.position.distanceTo( this.position );
  			if ( distance > 0 && distance <= _neighborhoodRadius ) {
  				velSum.add( boid.velocity );
  				count++;
  			}
  		}
  		if ( count > 0 ) {
  			velSum.divideScalar( count );
  			var l = velSum.length();
  			if ( l > _maxSteerForce ) {
  				velSum.divideScalar( l / _maxSteerForce );
  			}
  		}
  		return velSum;
  	};
  	this.cohesion = function ( boids ) {
  		var boid, distance,
  		posSum = new THREE.Vector3(),
  		steer = new THREE.Vector3(),
  		count = 0;
  		for ( var i = 0, il = boids.length; i < il; i ++ ) {
  			if ( Math.random() > 0.6 ) continue;
  			boid = boids[ i ];
  			distance = boid.position.distanceTo( this.position );
  			if ( distance > 0 && distance <= _neighborhoodRadius ) {
  				posSum.add( boid.position );
  				count++;
  			}
  		}
  		if ( count > 0 ) {
  			posSum.divideScalar( count );
  		}
  		steer.subVectors( posSum, this.position );
  		var l = steer.length();
  		if ( l > _maxSteerForce ) {
  			steer.divideScalar( l / _maxSteerForce );
  		}
  		return steer;
  	};
  	this.separation = function ( boids ) {
  		var boid, distance,
  		posSum = new THREE.Vector3(),
  		repulse = new THREE.Vector3();
  		for ( var i = 0, il = boids.length; i < il; i ++ ) {
  			if ( Math.random() > 0.6 ) continue;
  			boid = boids[ i ];
  			distance = boid.position.distanceTo( this.position );
  			if ( distance > 0 && distance <= _neighborhoodRadius ) {
  				repulse.subVectors( this.position, boid.position );
  				repulse.normalize();
  				repulse.divideScalar( distance );
  				posSum.add( repulse );
  			}
  		}
  		return posSum;
  	}
  }

  var SCREEN_WIDTH_HALF = SCREEN_WIDTH  / 2,
  SCREEN_HEIGHT_HALF = SCREEN_HEIGHT / 2;
  var camera, scene, renderer,
  birds, bird;
  var boid, boids;
  if (document.getElementById('bird-container')) {
    initBirds();
    animate();
  }
  function initBirds() {
  	camera = new THREE.PerspectiveCamera( 75, SCREEN_WIDTH / SCREEN_HEIGHT, 1, 10000 );
  	camera.position.z = 450;
  	scene = new THREE.Scene();
  	birds = [];
  	boids = [];
  	for ( var i = 0; i < 200; i ++ ) {
  		boid = boids[ i ] = new Boid();
  		boid.position.x = Math.random() * 400 - 200;
  		boid.position.y = Math.random() * 400 - 200;
  		boid.position.z = Math.random() * 400 - 200;
  		boid.velocity.x = Math.random() * 2 - 1;
  		boid.velocity.y = Math.random() * 2 - 1;
  		boid.velocity.z = Math.random() * 2 - 1;
  		boid.setAvoidWalls( true );
  		boid.setWorldSize( 500, 500, 400 );
  		bird = birds[ i ] = new THREE.Mesh( new Bird(), new THREE.MeshBasicMaterial( { color:Math.random() * 0xffffff, side: THREE.DoubleSide } ) );
  		bird.phase = Math.floor( Math.random() * 62.83 );
  		scene.add( bird );
  	}
  	renderer = new THREE.CanvasRenderer();
  	renderer.setClearColor( 0xffffff );
  	renderer.setPixelRatio( window.devicePixelRatio );
  	renderer.setSize( SCREEN_WIDTH, SCREEN_HEIGHT );
  	document.addEventListener( 'mousemove', onDocumentMouseMove, false );
  	document.getElementById('bird-container').appendChild( renderer.domElement );

  	window.addEventListener( 'resize', onWindowResizeBirds, false );
  }
  function onWindowResizeBirds() {
  	camera.aspect = window.innerWidth / window.innerHeight;
  	camera.updateProjectionMatrix();
  	renderer.setSize( window.innerWidth, window.innerHeight );
  }
  function onDocumentMouseMove( event ) {
  	var vector = new THREE.Vector3( event.clientX - SCREEN_WIDTH_HALF, - event.clientY + SCREEN_HEIGHT_HALF, 0 );
  	for ( var i = 0, il = boids.length; i < il; i++ ) {
  		boid = boids[ i ];
  		vector.z = boid.position.z;
  		boid.repulse( vector );
  	}
  }
  function animate() {
    requestAnimationFrame( animate );
    render();
  }
  //
  function render() {
  	for ( var i = 0, il = birds.length; i < il; i++ ) {
  		boid = boids[ i ];
  		boid.run( boids );
  		bird = birds[ i ];
  		bird.position.copy( boids[ i ].position );
  		color = bird.material.color;
  		color.r = color.g = color.b = ( 500 - bird.position.z ) / 1000;
  		bird.rotation.y = Math.atan2( - boid.velocity.z, boid.velocity.x );
  		bird.rotation.z = Math.asin( boid.velocity.y / boid.velocity.length() );
  		bird.phase = ( bird.phase + ( Math.max( 0, bird.rotation.z ) + 0.1 )  ) % 62.83;
  		bird.geometry.vertices[ 5 ].y = bird.geometry.vertices[ 4 ].y = Math.sin( bird.phase ) * 5;
  	}
  	renderer.render( scene, camera );
  }
}

require('./components');
