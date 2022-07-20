import { Application } from "@hotwired/stimulus"
import * as Popper from "@popperjs/core"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
