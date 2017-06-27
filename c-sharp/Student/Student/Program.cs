using System;

namespace MtSac.CISP41
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            Student st = new Student();

            Console.WriteLine("What is your first name?");
            st.FirstName = Console.ReadLine();
            Console.WriteLine("What is your last name?");
            st.LastName = Console.ReadLine();

            String FullName = st.GetFullName();

            Console.WriteLine("What is your DOB?");
            st.DOB = Console.ReadLine();
            st.Age = st.GetAge().ToString();

            Console.WriteLine("Your full name is {0}.", FullName);
            Console.WriteLine("Your DOB is {0} and your age is {1}.", st.DOB, st.Age);
        }
    }
}
