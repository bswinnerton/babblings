# babblings

[![Build Status](https://semaphoreapp.com/api/v1/projects/dddcfd25-0926-450e-908d-4bfc47c3b270/274770/shields_badge.svg)](https://semaphoreapp.com/bswinnerton/babblings--2)
[![Code Climate](https://codeclimate.com/github/bswinnerton/babblings/badges/gpa.svg)](https://codeclimate.com/github/bswinnerton/babblings)
[![Test Coverage](https://codeclimate.com/github/bswinnerton/babblings/badges/coverage.svg)](https://codeclimate.com/github/bswinnerton/babblings)

This is a masonry-layout Rails application that supports multiple content types (Picture, Youtube video, Vimeo video, Spotify song and Quotes). It can be seen at http://babblin.gs.

New posts can be created at [http://babblin.gs/posts/new](http://babblin.gs/posts/new)

[![babblings](http://i.imgur.com/PxVkpKe.png)](http://babblin.gs)

## API

There is a read-only REST JSON API available at `http://babblin.gs/api/v1/`.

---

### `/posts/`

Get a group of all posts, ordered by the most recent submission.

`http://babblin.gs/api/v1/posts`

```json
{
  "posts": [
    {
      "id": 295,
      "type": "Picture",
      "content": "http://i.imgur.com/rDWyklm.jpg",
      "width": 930,
      "height": 620,
      "ratio": 0.666666666666667,
      "created_at": "2014-11-05T04:11:00.835Z",
      "updated_at": "2014-11-05T04:11:07.608Z",
      "image_updated_at": "2014-11-05T04:11:04.620Z",
      "deleted_at": null,
      "image_processing": false,
      "thumbnail_image": "http://s3.amazonaws.com/s3.babblin.gs/pictures/images/000/000/295/thumbnail/rDWyklm.jpg?1415160664",
      "full_image": "http://s3.amazonaws.com/s3.babblin.gs/pictures/images/000/000/295/full/rDWyklm.jpg?1415160664"
    },
  ...
  ]
}
```

---

### `/posts/:id`

Get one post, by id.

`http://babblin.gs/api/v1/posts/296`

```json
{
  "posts": {
    "id": 296,
    "type": "Vimeo",
    "content": "110449109",
    "width": null,
    "height": null,
    "ratio": null,
    "created_at": "2014-11-06T12:59:25.131Z",
    "updated_at": "2014-11-06T12:59:25.131Z",
    "image_updated_at": null,
    "deleted_at": null,
    "image_processing": false,
    "thumbnail_image": null,
    "full_image": null
  }
}
```

---

### `/pictures/`

Get a specific subset of posts, ordered by the most recent submission.

`http://babblin.gs/api/v1/pictures`

```json
{
  "pictures": [
    {
      "id": 295,
      "type": "Picture"
      "content": "http://i.imgur.com/rDWyklm.jpg",
      "width": 930,
      "height": 620,
      "ratio": 0.666666666666667,
      "created_at": "2014-11-05T04:11:00.835Z",
      "updated_at": "2014-11-05T04:11:07.608Z",
      "image_updated_at": "2014-11-05T04:11:04.620Z",
      "deleted_at": null,
      "image_processing": false,
      "thumbnail_image": "http://s3.amazonaws.com/s3.babblin.gs/pictures/images/000/000/295/thumbnail/rDWyklm.jpg?1415160664",
      "full_image": "http://s3.amazonaws.com/s3.babblin.gs/pictures/images/000/000/295/full/rDWyklm.jpg?1415160664",
    },
    ...
  ]
}
```

---

### `/pictures/:id`

Get one post, of a specific subset, by id.

```json
{
  "pictures": {
    "id": 294,
    "type": "Picture"
    "content": "http://i.imgur.com/c1foeTp.jpg",
    "width": 1190,
    "height": 799,
    "ratio": 0.671428571428571,
    "created_at": "2014-11-05T04:04:23.566Z",
    "updated_at": "2014-11-05T04:04:31.906Z",
    "image_updated_at": "2014-11-05T04:04:30.715Z",
    "deleted_at": null,
    "image_processing": false,
    "thumbnail_image": "http://s3.amazonaws.com/s3.babblin.gs/pictures/images/000/000/294/thumbnail/c1foeTp.jpg?1415160270",
    "full_image": "http://s3.amazonaws.com/s3.babblin.gs/pictures/images/000/000/294/full/c1foeTp.jpg?1415160270",
  }
}
```

---

### `/quotes/`

---

### `/quotes/:id`

---

### `/spotifys/`

---

### `/spotifys/:id`

---

### `/vimeos/`

---

### `/vimeos/:id`

---

### `/youtubes/`

---

### `/youtubes/:id`

---
