// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap/dist/js/bootstrap")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")

import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


const handleBookmarkDisplay = (hasBookmarked) => {
    if (hasBookmarked) {
        $('.active-book').removeClass('hidden')
    } else {
        $('.inactive-book').removeClass('hidden')
    }
}

document.addEventListener('turbolinks:load', () => {
    const dataset = $('#post-show').data()
    const postId = dataset.postId
    axios.get(`/posts/${postId}/bookmark`)
      .then((response) => {
        const hasBookmarked = response.data.hasBookmarked
        handleBookmarkDisplay(hasBookmarked)
    })

    $('.inactive-book').on('click', () => {
        axios.post(`/posts/${postId}/bookmark`)
          .then((response) => {
            console.log(response)
          })
          .catch((e) => {
            window.alert('Error')
            console.log(e)
          })
    })
  
      $('.active-book').on('click', () => {
          axios.delete(`/postss/${postId}/bookmark`)
            .then((response) => {
              console.log(response)
            })
            .catch((e) => {
              window.alert('Error')
              console.log(e)
            })
    })
})