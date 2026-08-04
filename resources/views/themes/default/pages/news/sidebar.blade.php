  <div class="col-lg-4">
      <aside>
          <div class="sidebar_search mb-4">
              <form action="{{ route('news.list') }}" method="GET">
                  <div class="input_groups position-relative">
                      <input value="{{ $keyword }}" type="text" name="search" placeholder="Search here...">
                      <button><i class="fa-solid fa-magnifying-glass"></i></button>
                  </div>
              </form>
          </div>
          <div class="sidebar_widget mb-4">
              <h4 class="title">Recent Post</h4>
              <ul class="list-unstyled recent_post">
                  @foreach ($recent_post ?? [] as $item)
                      <li>
                          <a href="{{ route('news.details', ['slug' => $item->slug ?? '']) }}" class="d-flex gap-3">
                              <div class="img flex-shrink-0">
                                  <img src="{{ $item->image_three ?? '' }}" alt="{{ $item->title ?? '' }}"
                                      class="img-fluid w-100">
                              </div>
                              <div class="text flex-grow-1">
                                  <h3 class="news_title">{{ Str::limit($item->title ?? '', 30, '...') }}</h3>
                                  <span>{{ \Carbon\Carbon::parse($item->date)->format('F d, Y') }}</span>
                              </div>
                          </a>
                      </li>
                  @endforeach
              </ul>
          </div>
          <div class="sidebar_widget mb-4">
              <h4 class="title">Tags</h4>
              <div class="tags">
                  @foreach ($allTags as $item => $count)
                      <a class="tag-cloud-link" href="{{ route('news.list', ['tag' => $item]) }}">
                          {{ $item }}<span class="tag-link-count"> ({{ $count }})</span>
                      </a>
                  @endforeach
              </div>
          </div>
      </aside>
  </div>
