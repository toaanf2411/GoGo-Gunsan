'use strict';

const Heading = ({ date, changeMonth, resetDate }) =>
  React.createElement("nav", { className: "calendar--nav" },
    React.createElement("a", { onClick: () => changeMonth(date.month() - 1) }, "\u2039"),
    React.createElement("h1", { onClick: () => resetDate() }, date.format('MMMM'), " ", React.createElement("small", null, date.format('YYYY'))),
    React.createElement("a", { onClick: () => changeMonth(date.month() + 1) }, "\u203A"));



const Day = ({ currentDate, date, startDate, endDate, onClick }) => {
  let className = [];

  if (moment().isSame(date, 'day')) {
    className.push('active');
  }

  if (date.isSame(startDate, 'day')) {
    className.push('start');
  }

  if (date.isBetween(startDate, endDate, 'day')) {
    className.push('between');
  }

  if (date.isSame(endDate, 'day')) {
    className.push('end');
  }

  if (!date.isSame(currentDate, 'month')) {
    className.push('muted');
  }

  return (
    React.createElement("span", { onClick: () => onClick(date), currentDate: date, className: className.join(' ') }, date.date()));

};

const Days = ({ date, startDate, endDate, onClick }) => {
  const thisDate = moment(date);
  const daysInMonth = moment(date).daysInMonth();
  const firstDayDate = moment(date).startOf('month');
  const previousMonth = moment(date).subtract(1, 'month');
  const previousMonthDays = previousMonth.daysInMonth();
  const nextsMonth = moment(date).add(1, 'month');
  let days = [];
  let labels = [];

  for (let i = 1; i <= 7; i++) {
    labels.push(React.createElement("span", { className: "label" }, moment().day(i).format('ddd')));
  }

  for (let i = firstDayDate.day(); i > 1; i--) {
    previousMonth.date(previousMonthDays - i + 2);

    days.push(
      React.createElement(Day, { key: moment(previousMonth).format('YYYY MM DD'), onClick: date => onClick(date), currentDate: date, date: moment(previousMonth), startDate: startDate, endDate: endDate }));

  }

  for (let i = 1; i <= daysInMonth; i++) {
    thisDate.date(i);

    days.push(
      React.createElement(Day, { key: moment(thisDate).format('YYYY MM DD'), onClick: date => onClick(date), currentDate: date, date: moment(thisDate), startDate: startDate, endDate: endDate }));

  }

  const daysCount = days.length;
  for (let i = 1; i <= 42 - daysCount; i++) {
    nextsMonth.date(i);
    days.push(
      React.createElement(Day, { key: moment(nextsMonth).format('YYYY MM DD'), onClick: date => onClick(date), currentDate: date, date: moment(nextsMonth), startDate: startDate, endDate: endDate }));

  }

  return (
    React.createElement("nav", { className: "calendar--days" },
      labels.concat(),
      days.concat()));


};

class Calendar extends React.Component {
  constructor(props) {
    super(props);

       this.state = {
         date: moment(),
         startDate: moment(),
         endDate: moment() 
        };

  }

  resetDate() {
    this.setState({
      date: moment()
    });

  }

  changeMonth(month) {
    const { date } = this.state;

    date.month(month);

    this.setState(
      date);

  }

  changeDate(date) {
    let { startDate, endDate } = this.state;

    if (startDate === null || date.isBefore(startDate, 'day') || !startDate.isSame(endDate, 'day')) {
      startDate = moment(date);
      endDate = moment(date);
    } else if (date.isSame(startDate, 'day') && date.isSame(endDate, 'day')) {
      startDate = null;
      endDate = null;
    } else if (date.isAfter(startDate, 'day')) {
      endDate = moment(date);
    }

    this.setState({
      startDate,
      endDate
    });

  }

  render() {
    const { date, startDate, endDate } = this.state;

    return (
      React.createElement("div", { className: "calendar" },
        React.createElement(Heading, { date: date, changeMonth: month => this.changeMonth(month), resetDate: () => this.resetDate() }),

        React.createElement(Days, { onClick: date => this.changeDate(date), date: date, startDate: startDate, endDate: endDate })));


  }
}


ReactDOM.render(
  React.createElement(Calendar, null),
  document.getElementById('calendar')
  );