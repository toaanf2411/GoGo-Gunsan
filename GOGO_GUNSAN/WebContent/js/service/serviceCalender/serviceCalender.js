 $(function () {
        

        function onSelectHandler(date, context) {
            /**
             * @date is an array which be included dates(clicked date at first index)
             * @context is an object which stored calendar interal data.
             * @context.calendar is a root element reference.
             * @context.calendar is a calendar element reference.
             * @context.storage.activeDates is all toggled data, If you use toggle type calendar.
             * @context.storage.events is all events associated to this date
             */

            var $element = context.element;
            var $calendar = context.calendar;

            var text = '';
            

            if (date[0] !== null) {
                text += date[0].format('YYYY/MM/DD');
            }

            if (date[0] !== null && date[1] !== null) {
                text += ' ~ ';
            }
            else if (date[0] === null && date[1] == null) {
                text += 'null';
            }

            if (date[1] !== null) {
                text += date[1].format('YYYY/MM/DD');
            }

            console.log(text);
        }

       

        
        // Blue theme type Calendar
        $('.calendar-blue').pignoseCalendar({
            theme: 'blue', // light, dark, blue
            select: onSelectHandler,
            lang: 'ko'
        });

       
    });