using System;

namespace Checkpoint2
{
    public class Event
    {
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string Description { get; set; }

        public Event(String description)
        {
            Description = description;
        }

        public void Postpone(TimeSpan timeDelta)
        {
            StartTime = StartTime + timeDelta;
            EndTime = EndTime + timeDelta;
        }
    }
}