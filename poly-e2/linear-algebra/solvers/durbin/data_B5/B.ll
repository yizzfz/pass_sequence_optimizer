; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  tail call void @init_array(i32 2000, double* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call1 to double*
  tail call void @kernel_durbin(i32 2000, double* %arraydecay, double* %arraydecay3)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 2000, double* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, double* nocapture %r) #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %add = add nsw i32 %n, 1
  %0 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.lr.ph
  br label %for.body.prol

for.body.prol:                                    ; preds = %for.body.prol.preheader, %for.body.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ 0, %for.body.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body.prol ], [ %xtraiter, %for.body.prol.preheader ]
  %1 = trunc i64 %indvars.iv.prol to i32
  %sub.prol = sub i32 %add, %1
  %conv.prol = sitofp i32 %sub.prol to double
  %arrayidx.prol = getelementptr inbounds double, double* %r, i64 %indvars.iv.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.prol.loopexit.loopexit, label %for.body.prol, !llvm.loop !1

for.body.prol.loopexit.loopexit:                  ; preds = %for.body.prol
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol.loopexit.loopexit, %for.body.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol.loopexit.loopexit ]
  %2 = icmp ult i32 %0, 3
  br i1 %2, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.prol.loopexit
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.preheader ], [ %indvars.iv.next.3, %for.body ]
  %3 = trunc i64 %indvars.iv to i32
  %sub = sub i32 %add, %3
  %conv = sitofp i32 %sub to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = trunc i64 %indvars.iv.next to i32
  %sub.1 = sub i32 %add, %4
  %conv.1 = sitofp i32 %sub.1 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %5 = trunc i64 %indvars.iv.next.1 to i32
  %sub.2 = sub i32 %add, %5
  %conv.2 = sitofp i32 %sub.2 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %6 = trunc i64 %indvars.iv.next.2 to i32
  %sub.3 = sub i32 %add, %6
  %conv.3 = sitofp i32 %sub.3 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body.prol.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_durbin(i32 %n, double* nocapture readonly %r, double* nocapture %y) #2 {
entry:
  %y23 = bitcast double* %y to i8*
  %z = alloca [2000 x double], align 16
  %z24 = bitcast [2000 x double]* %z to i8*
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %cmp5 = icmp sgt i32 %n, 1
  br i1 %cmp5, label %for.body.preheader, label %for.end49

for.body.preheader:                               ; preds = %entry
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %2 = add i32 %n, -1
  %arrayidx31.prol = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 0
  %wide.trip.count31 = zext i32 %2 to i64
  br label %for.body8.lr.ph

for.body8.lr.ph:                                  ; preds = %for.end44.for.body8.lr.ph_crit_edge, %for.body.preheader
  %indvars.iv27 = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next28, %for.end44.for.body8.lr.ph_crit_edge ]
  %indvar25 = phi i64 [ 0, %for.body.preheader ], [ %indvar.next26, %for.end44.for.body8.lr.ph_crit_edge ]
  %indvar = phi i32 [ 0, %for.body.preheader ], [ %indvar.next, %for.end44.for.body8.lr.ph_crit_edge ]
  %3 = phi double [ %sub3, %for.body.preheader ], [ %div, %for.end44.for.body8.lr.ph_crit_edge ]
  %4 = phi double [ 1.000000e+00, %for.body.preheader ], [ %mul5, %for.end44.for.body8.lr.ph_crit_edge ]
  %5 = shl i64 %indvar25, 3
  %6 = add nuw nsw i64 %5, 8
  %mul = fmul double %3, %3
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %4, %sub4
  %7 = add nuw nsw i32 %indvar, 1
  %8 = add nsw i64 %indvars.iv27, -1
  %xtraiter = and i32 %7, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body8.prol.loopexit, label %for.body8.prol.preheader

for.body8.prol.preheader:                         ; preds = %for.body8.lr.ph
  br label %for.body8.prol

for.body8.prol:                                   ; preds = %for.body8.prol.preheader, %for.body8.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body8.prol ], [ 0, %for.body8.prol.preheader ]
  %9 = phi double [ %add.prol, %for.body8.prol ], [ 0.000000e+00, %for.body8.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body8.prol ], [ %xtraiter, %for.body8.prol.preheader ]
  %10 = sub nsw i64 %8, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %10
  %11 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %12 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %11, %12
  %add.prol = fadd double %9, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body8.prol.loopexit.loopexit, label %for.body8.prol, !llvm.loop !3

for.body8.prol.loopexit.loopexit:                 ; preds = %for.body8.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol.loopexit.loopexit, %for.body8.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body8.lr.ph ], [ %indvars.iv.next.prol, %for.body8.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %for.body8.lr.ph ], [ %add.prol, %for.body8.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body8.lr.ph ], [ %add.prol, %for.body8.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %indvar, 3
  br i1 %13, label %for.body21.lr.ph, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body8 ], [ %indvars.iv.unr, %for.body8.preheader ]
  %14 = phi double [ %add.3, %for.body8 ], [ %.unr, %for.body8.preheader ]
  %15 = sub nsw i64 %8, %indvars.iv
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %15
  %16 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %17 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %16, %17
  %add = fadd double %14, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = sub nsw i64 %8, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %18
  %19 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %20 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %19, %20
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %21 = sub nsw i64 %8, %indvars.iv.next.1
  %arrayidx11.2 = getelementptr inbounds double, double* %r, i64 %21
  %22 = load double, double* %arrayidx11.2, align 8
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %23 = load double, double* %arrayidx13.2, align 8
  %mul14.2 = fmul double %22, %23
  %add.2 = fadd double %add.1, %mul14.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %24 = sub nsw i64 %8, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %24
  %25 = load double, double* %arrayidx11.3, align 8
  %arrayidx13.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %26 = load double, double* %arrayidx13.3, align 8
  %mul14.3 = fmul double %25, %26
  %add.3 = fadd double %add.2, %mul14.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv27
  br i1 %exitcond.3, label %for.body21.lr.ph.loopexit, label %for.body8

for.body21.lr.ph.loopexit:                        ; preds = %for.body8
  br label %for.body21.lr.ph

for.body21.lr.ph:                                 ; preds = %for.body21.lr.ph.loopexit, %for.body8.prol.loopexit
  %add.lcssa = phi double [ %add.lcssa.unr, %for.body8.prol.loopexit ], [ %add.3, %for.body21.lr.ph.loopexit ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv27
  %27 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %27
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %28 = add nsw i64 %indvars.iv27, -1
  %29 = and i32 %indvar, 1
  %lcmp.mod16 = icmp eq i32 %29, 0
  br i1 %lcmp.mod16, label %for.body21.prol, label %for.body21.prol.loopexit

for.body21.prol:                                  ; preds = %for.body21.lr.ph
  %30 = load double, double* %y, align 8
  %arrayidx27.prol = getelementptr inbounds double, double* %y, i64 %28
  %31 = load double, double* %arrayidx27.prol, align 8
  %mul28.prol = fmul double %div, %31
  %add29.prol = fadd double %30, %mul28.prol
  store double %add29.prol, double* %arrayidx31.prol, align 16
  br label %for.body21.prol.loopexit

for.body21.prol.loopexit:                         ; preds = %for.body21.lr.ph, %for.body21.prol
  %indvars.iv9.unr.ph = phi i64 [ 1, %for.body21.prol ], [ 0, %for.body21.lr.ph ]
  %32 = icmp eq i32 %indvar, 0
  br i1 %32, label %for.end44, label %for.body21.preheader

for.body21.preheader:                             ; preds = %for.body21.prol.loopexit
  br label %for.body21

for.body21:                                       ; preds = %for.body21.preheader, %for.body21
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %for.body21 ], [ %indvars.iv9.unr.ph, %for.body21.preheader ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv9
  %33 = load double, double* %arrayidx23, align 8
  %34 = sub nsw i64 %28, %indvars.iv9
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %34
  %35 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %35
  %add29 = fadd double %33, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv9
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %arrayidx23.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next10
  %36 = load double, double* %arrayidx23.1, align 8
  %37 = sub nsw i64 %28, %indvars.iv.next10
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %37
  %38 = load double, double* %arrayidx27.1, align 8
  %mul28.1 = fmul double %div, %38
  %add29.1 = fadd double %36, %mul28.1
  %arrayidx31.1 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv.next10
  store double %add29.1, double* %arrayidx31.1, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next10.1, %indvars.iv27
  br i1 %exitcond.1, label %for.end44.loopexit, label %for.body21

for.end44.loopexit:                               ; preds = %for.body21
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %for.body21.prol.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %y23, i8* nonnull %z24, i64 %6, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv27
  store double %div, double* %arrayidx46, align 8
  %indvar.next26 = add nuw nsw i64 %indvar25, 1
  %exitcond = icmp eq i64 %indvar.next26, %wide.trip.count31
  br i1 %exitcond, label %for.end49.loopexit, label %for.end44.for.body8.lr.ph_crit_edge

for.end44.for.body8.lr.ph_crit_edge:              ; preds = %for.end44
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  br label %for.body8.lr.ph

for.end49.loopexit:                               ; preds = %for.end44
  br label %for.end49

for.end49:                                        ; preds = %for.end49.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* nocapture readonly %y) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
