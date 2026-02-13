const API_BASE = 'http://localhost:8080/api';

// Tab functionality
function showTab(tabName) {
    document.querySelectorAll('.tab-content').forEach(tab => tab.classList.remove('active'));
    document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
    
    document.getElementById(tabName).classList.add('active');
    event.target.classList.add('active');
    
    if (tabName === 'activities') {
        loadActivities();
    } else if (tabName === 'feedback') {
        loadFeedback();
    }
}

// Activity Management
document.getElementById('activityForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const activity = {
        title: document.getElementById('activityTitle').value,
        description: document.getElementById('activityDescription').value,
        status: document.getElementById('activityStatus').value
    };
    
    console.log('Submitting activity:', activity);
    
    try {
        const response = await fetch(`${API_BASE}/activities`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(activity)
        });
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        console.log('Activity created successfully');
        document.getElementById('activityForm').reset();
        loadActivities();
    } catch (error) {
        console.error('Error creating activity:', error);
        alert('Failed to create activity. Check console for details.');
    }
});

async function loadActivities() {
    try {
        console.log('Loading activities from:', `${API_BASE}/activities`);
        const response = await fetch(`${API_BASE}/activities`);
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const activities = await response.json();
        console.log('Loaded activities:', activities);
        
        const container = document.getElementById('activitiesList');
        if (activities.length === 0) {
            container.innerHTML = '<p>No activities found. Add one above!</p>';
            return;
        }
        
        container.innerHTML = activities.map(activity => `
            <div class="item">
                <div class="item-header">
                    <span class="item-title">${activity.title}</span>
                    <div>
                        <span class="status ${activity.status}">${activity.status.replace('-', ' ').toUpperCase()}</span>
                        <button class="delete-btn" onclick="deleteActivity(${activity.id})">Delete</button>
                    </div>
                </div>
                <p>${activity.description || 'No description'}</p>
                <div class="item-meta">
                    Created: ${new Date(activity.createdAt).toLocaleString()}
                    ${activity.updatedAt !== activity.createdAt ? 
                        `| Updated: ${new Date(activity.updatedAt).toLocaleString()}` : ''}
                </div>
            </div>
        `).join('');
    } catch (error) {
        console.error('Error loading activities:', error);
        document.getElementById('activitiesList').innerHTML = '<p>Error loading activities. Is the server running?</p>';
    }
}

async function deleteActivity(id) {
    if (confirm('Are you sure you want to delete this activity?')) {
        try {
            await fetch(`${API_BASE}/activities/${id}`, { method: 'DELETE' });
            loadActivities();
        } catch (error) {
            console.error('Error deleting activity:', error);
        }
    }
}

// Feedback Management
document.getElementById('feedbackForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const feedback = {
        category: document.getElementById('feedbackCategory').value,
        content: document.getElementById('feedbackContent').value,
        severity: document.getElementById('feedbackSeverity').value
    };
    
    try {
        await fetch(`${API_BASE}/feedback`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(feedback)
        });
        
        document.getElementById('feedbackForm').reset();
        loadFeedback();
    } catch (error) {
        console.error('Error creating feedback:', error);
    }
});

async function loadFeedback() {
    try {
        const response = await fetch(`${API_BASE}/feedback`);
        const feedback = await response.json();
        
        const container = document.getElementById('feedbackList');
        container.innerHTML = feedback.map(item => `
            <div class="item">
                <div class="item-header">
                    <span class="item-title">${item.category.toUpperCase()}</span>
                    <div>
                        <span class="severity ${item.severity}">${item.severity.toUpperCase()}</span>
                        <button class="delete-btn" onclick="deleteFeedback(${item.id})">Delete</button>
                    </div>
                </div>
                <p>${item.content}</p>
                <div class="item-meta">
                    Created: ${new Date(item.createdAt).toLocaleString()}
                </div>
            </div>
        `).join('');
    } catch (error) {
        console.error('Error loading feedback:', error);
    }
}

async function deleteFeedback(id) {
    if (confirm('Are you sure you want to delete this feedback?')) {
        try {
            await fetch(`${API_BASE}/feedback/${id}`, { method: 'DELETE' });
            loadFeedback();
        } catch (error) {
            console.error('Error deleting feedback:', error);
        }
    }
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    loadActivities();
});