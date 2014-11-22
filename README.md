# babblings

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
      "type": "Picture"
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
    "content": "110449109",
    "width": null,
    "height": null,
    "ratio": null,
    "created_at": "2014-11-06T12:59:25.131Z",
    "updated_at": "2014-11-06T12:59:25.131Z",
    "image_updated_at": null,
    "deleted_at": null,
    "image_processing": false,
    "type": "Vimeo"
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
      "type": "Picture"
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
    "type": "Picture"
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
