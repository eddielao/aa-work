using System;
namespace MtSac.CISP41
{
    public class Student
    {
        // Fields & Properties
        private String _FirstName;

        public String FirstName
        {
            get { return _FirstName; }
            set { _FirstName = value; }
        }

        private String _LastName;

        public String LastName
        {
            get { return _LastName; }
            set { _LastName = value; }
        }

        private DateTime _DOB;

        public String DOB
        {
            get 
            {
                String Year = _DOB.Year.ToString();
                String Month = _DOB.Month.ToString();
                String Day = _DOB.Day.ToString();
                return Month + "/" + Day + "/" + Year; 
            }
            set { DateTime.TryParse(value, out _DOB); }
        }

        private Decimal _Age;

        public String Age
        {
            get { return _Age.ToString(); }
            set { Decimal.TryParse(value, out _Age); }
        }

        private Int32 _CompletedAssignments;

        public String CompletedAssignments
        {
            get { return _CompletedAssignments.ToString(); }
            set { Int32.TryParse(value, out _CompletedAssignments);}
        }

        // Methods

        public Decimal GetAge()
        {
            DateTime Today = DateTime.Today;
            Decimal AgeYear = Today.Year - _DOB.Year;

            if (Today.Month < _DOB.Month)
            {
                AgeYear = AgeYear - 1;
            }
            else if (Today.Month == _DOB.Month)
            {
                if (Today.Day < _DOB.Day)
                {
                    AgeYear = AgeYear - 1;
                }
            }

            return AgeYear;
        }

        public String GetFullName()
        {
            return _FirstName + " " + _LastName;
        }

        public Boolean SubmitAssignment()
        {
            return true;
        }

        // Constructor

        public Student()
        {
            _FirstName = "";
            _LastName = "";
            DOB = "";
            Age = "";
            CompletedAssignments = "";
        }
    }
}