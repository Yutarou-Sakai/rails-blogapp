// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")


import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
// import { response } from "express"

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleHeartDisplay = (hasLiked) => {
    if (hasLiked) {
        $('#active-heart').removeClass('hidden')
    } else {
        $('#inactive-heart').removeClass('hidden')
    }
}

document.addEventListener('turbolinks:load', () => {
    const dataset = $('#article-show').data()
    const articleId = dataset.articleId

    axios.get(`/articles/${articleId}/like`)
        .then((response) => {
            const hasLiked = response.data.hasLiked
            handleHeartDisplay(hasLiked)
        })

    $('#inactive-heart').on('click', () => {
        axios.post(`/articles/${articleId}/like`)
            .then((response) => {
                if (response.data.status === 'ok') {
                    $('#active-heart').removeClass('hidden')
                    $('#inactive-heart').addClass('hidden')
                }
            })
            .catch((e) => {
                window.alert('Error')
                console.log(e)
            })
    })

    $('#active-heart').on('click', () => {
        axios.delete(`/articles/${articleId}/like`)
            .then((response) => {
                if (response.data.status === 'ok') {
                    $('#active-heart').addClass('hidden')
                    $('#inactive-heart').removeClass('hidden')
                }
            })
            .catch((e) => {
                window.alert('Error')
                console.log(e)
            })
    })
})