 

namespace Events
{
    public interface ApplicantAppliedEvent
    {
        int JobId { get; }
        int ApplicantId { get; }
        string Title { get; }
    }
}
