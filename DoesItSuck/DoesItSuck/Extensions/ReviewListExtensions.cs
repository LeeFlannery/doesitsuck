namespace DoesItSuck.Extensions
{
    using DoesItSuck.Models;
    using System;
    using System.Collections.Generic;

    public static class ReviewListExtensions
    {
        /// <summary>
        /// Assigns the arrangments for the review list, pseudo-randomly.
        /// </summary>
        /// <param name="Reviews">List of reviews for display.</param>
        public static void SetArrangments(this List<Review> Reviews)
        {
            var rand = new Random();
            foreach (var list in Reviews)
            {
                Arrangement[] values = (Arrangement[])(Enum.GetValues(typeof(Arrangement)));
                list.Arrangement = values[rand.Next(0, values.Length)];
            }
        }

        /// <summary>
        /// Assigns the arrangments for the review list. If there are more reviews than
        /// arrangments, start back at the beginning of the arrangment list when you run out.
        /// </summary>
        /// <param name="Reviews">List of reviews for display.</param>
        /// <param name="Arrangements">Array of arrangements to assign to the ReviewList.</param>
        public static void SetArrangments(this List<Review> Reviews, Arrangement[] Arrangements)
        {
            int index = 0;
            int endIndex = Arrangements.Length - 1;
            foreach (var list in Reviews)
            {
                if (index > endIndex)
                {
                    index = 0;
                }
                list.Arrangement = Arrangements[index++];
            }
        }
    }
}