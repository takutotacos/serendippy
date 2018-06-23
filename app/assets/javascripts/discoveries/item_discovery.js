$(".js-edit").on("click", function(e) {
    e.preventDefault();
    e.stopImmediatePropagation();

    var $this = $(this);

    var $parent = $this.parents(".js-container-text");
    var $form = $parent.next();

    $parent.addClass("hide");
    $form.removeClass("hide");
});

$(".js-submit").on("click", function(e) {
    e.preventDefault();
    e.stopImmediatePropagation();

    var $this = $(this);
    var $form = $this.parents(".js-container-form");

    var discoveryId = $form.data("target-discovery-id");
    var content = $form.find("textarea")[0].value;
    var checked_ids = []
    for (var i = 0; i < $form.find(":checkbox:checked").length; i++) {
        checked_ids.push($form.find(":checkbox:checked")[i].value)
    }

    $.ajax({
        url: "/discoveries/" + discoveryId,
        type: "PATCH",
        dataType: "json",
        data: {
            authenticity_token: $("meta[name=csrf-token]").attr("content"),
            discovery: {
                content: content,
                genre_ids: checked_ids
            },
            id: discoveryId
        }
    })
    .done(function(response) {
        var resultContent = response["discovery"]["content"];
        var resultGenreIds = response["discovery"]["genre_ids"];
        var resultGenreNames = response["discovery"]["genre_names"];

        // form の更新処理
        $form.addClass("hide");
        content.value = resultContent;

        var checkBoxes = $form.find(":checkbox")
        for(var i = 0; i < checkBoxes.length; i++) {
            var val = parseInt(checkBoxes[i].value);
            checkBoxes[i].checked = resultGenreIds.includes(val);
        }

        // textの更新処理
        var genresText = "genres:";
        for (var i = 0; i < resultGenreNames.length; i++) {
            var span = "<span class='circle theme'>" + resultGenreNames[i] + "</span>";
            genresText += " " + span
        }

        $text = $form.prev();
        $text.removeClass("hide");

        $text.find(".js-content-text")[0].innerText = content;
        $text.find(".js-genres-text")[0].innerHTML = genresText;
    })
    .fail(function(response) {
        var errorMessage = response.responseText == "" ? "通信に失敗しました。" : response.responseText;
        alert(errorMessage);
    })
});

