# styles
require './style.css'

# three.js
THREE = require 'three'

# create the scene
scene = new THREE.Scene()

# create a camera
camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 0.1, 1000

renderer = new THREE.WebGLRenderer()

# setSize
renderer.setSize window.innerWidth, window.innerHeight

# add to DOM
document.body.appendChild renderer.domElement

# create axis and add to scene
axis = new THREE.AxisHelper 10
scene.add axis

# create lights
light = new THREE.DirectionalLight 0xffffff, 1.0, 0
light.position.set 100, 100, 100
scene.add light

light2 = new THREE.DirectionalLight 0xffffff, 1.0, 0
light2.position.set -100, 100, -100
scene.add light2

material = new THREE.MeshBasicMaterial
	color: 0xaaaaaa
	wireframe: true

# create a box and add to scene 
box = new THREE.Mesh (new THREE.BoxGeometry 1, 1, 1), material
scene.add box

box.rotation.x = 0.5
box.rotation.y = 0.5
# box.position.z = -5

camera.position.x = 5
camera.position.y = 5
camera.position.z = 5

camera.lookAt scene.position

# rerender every frame
animate = ->
	requestAnimationFrame animate
	render()

render = ->
	timer = 0.002 * Date.now()
	box.position.y = 0.5 + 0.5 * Math.sin timer
	box.rotation.x += 0.1
	renderer.render scene, camera

# start
animate()