  let pastDates = true, availableDates = false, availableWeekDays = false;
            let selectedDate = new Date();
            let calendar = new VanillaCalendar({
                selector: "#myCalendar",
                months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                shortWeekday: ['일', '월', '화', '수', '목', '금', '토'],
                onSelect: (data, elem) => {
                    selectedDate = new Date(data[Object.keys(data)[0]]);
                    let year = selectedDate.getFullYear();
                    let month =selectedDate.getMonth()+1;
                    let date =selectedDate.getDate();
//                    console.log(selectedDate.getFullYear());
                    // console.log(data, elem)
                  
                    $('#date').val(String(year)+'/'+String(month)+'/'+date); 
   
                    
                }
})
           