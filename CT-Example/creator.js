var component
var sprite
function createSpriteObjects() {
    component = Qt.createComponent("Wuerfel.qml");
    sprite = component.createObject();

    if (sprite === null) {
        // Error Handling
        console.log("Error creating object");
    }
    return sprite
}
