$(document).on('turbolinks:load', function() {
//$(function () {
    console.log("Hello from profile-tab.js");
	$('.profile__stories').show();
    $('.profile__friends').hide();
	$('.profile__conversations').hide();


	$('.profile__tab').click(function () {
		console.log("click");
	});

	$('.profile__stories_tab').click(function () {
		$('.profile__stories_tab').addClass("profile__tab_active");
		$('.profile__friends_tab').removeClass("profile__tab_active");
		$('.profile__conversations_tab').removeClass("profile__tab_active");

		$('.profile__stories').show();
		$('.profile__friends').hide();
		$('.profile__conversations').hide();
	});

	$('.profile__friends_tab').click(function () {
		$('.profile__stories_tab').removeClass("profile__tab_active");
		$('.profile__friends_tab').addClass("profile__tab_active");
		$('.profile__conversations_tab').removeClass("profile__tab_active");

		$('.profile__stories').hide();
		$('.profile__friends').show();
		$('.profile__conversations').hide();
	});

	$('.profile__conversations_tab').click(function () {
		$('.profile__stories_tab').removeClass("profile__tab_active");
		$('.profile__friends_tab').removeClass("profile__tab_active");
		$('.profile__conversations_tab').addClass("profile__tab_active");

		$('.profile__stories').hide();
		$('.profile__friends').hide();
		$('.profile__conversations').show();
	});
});