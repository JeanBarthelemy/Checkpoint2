using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    public class Quest
    {
        public string Title { get; set; }

        public string Text { get; set; }

        public Expedition Expedition { get; set; }

        public Quest(string title, string text, Expedition expedition)
        {
            Title = title;
            Text = text;
            Expedition = expedition;
        }
    }
}
