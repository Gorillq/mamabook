import { Application } from '@hotwired/stimulus'
import Carousel from '@stimulus-components/carousel'

const application = Application.start()
application.register('carousel', Carousel)
