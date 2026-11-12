(function() {
    var duration = document.getElementById('backend-experience-duration');
    if (!duration) return;

    var start = duration.getAttribute('data-start').split('-');
    var now = new Date();
    // Compare calendar months; the day of the month does not affect the total.
    var months = Math.max(0,
        (now.getFullYear() - Number(start[0])) * 12
        + now.getMonth() + 1 - Number(start[1]));

    duration.textContent = duration.getAttribute('data-template')
        .replace('%{years}', Math.floor(months / 12))
        .replace('%{months}', months % 12);
})();
