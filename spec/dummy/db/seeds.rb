file = File.open(File.dirname(__FILE__) + '/pdf/recursive.pdf')

def create_document_stack(user, file)
  user.document_stack.slots.each do |slot|
    PapersPlease::StoreDocument
      .new(slot:  slot,
           file:  file,
           who:   user)
      .call
  end

  user.document_stack
end

def add_user(email, file)
  user = User.create(email: email)
  create_document_stack user, file
  user
end

def incomplete_stack(user, admin)
  stack = user.document_stack

  PapersPlease::AcceptDocuments
    .new(documents: stack.documents.take(2),
         who:       admin)
    .call

  PapersPlease::RejectDocuments
    .new(documents: stack.documents.drop(2),
         reason:    'Address does not match document',
         who:       admin)
    .call
end

def accepted_stack(user, admin)
  stack = user.document_stack

  PapersPlease::AcceptDocuments
    .new(documents: stack.documents,
         who:       admin)
    .call
end

admin = User.create email: 'admin@papers-please.com'

incomplete = add_user 'john.doe+1@gmail.com', file
valid1     = add_user 'john.doe+2@gmail.com', file
valid2     = add_user 'john.doe+3@gmail.com', file

incomplete_stack incomplete, admin
accepted_stack   valid1, admin
accepted_stack   valid2, admin
