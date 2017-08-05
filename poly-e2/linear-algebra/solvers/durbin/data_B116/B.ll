; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %.cast = bitcast i8* %call to double*
  tail call fastcc void @init_array(double* %.cast)
  tail call void (...) @polybench_timer_start() #4
  %0 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(double* %.cast, double* %0)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(double* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %r) unnamed_addr #2 {
for.inc.lr.ph:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.4, %for.inc ]
  %0 = trunc i64 %indvars.iv to i32
  %sub = sub nuw nsw i32 2001, %0
  %conv = sitofp i32 %sub to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %1 = trunc i64 %indvars.iv.next to i32
  %sub.1 = sub nuw nsw i32 2001, %1
  %conv.1 = sitofp i32 %sub.1 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %2 = trunc i64 %indvars.iv.next.1 to i32
  %sub.2 = sub nuw nsw i32 2001, %2
  %conv.2 = sitofp i32 %sub.2 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %3 = trunc i64 %indvars.iv.next.2 to i32
  %sub.3 = sub nuw nsw i32 2001, %3
  %conv.3 = sitofp i32 %sub.3 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %4 = trunc i64 %indvars.iv.next.3 to i32
  %sub.4 = sub nuw nsw i32 2001, %4
  %conv.4 = sitofp i32 %sub.4 to double
  %arrayidx.4 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly %r, double* nocapture %y) unnamed_addr #2 {
for.body.lr.ph:
  %z = alloca [2000 x double], align 16
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %2 = bitcast double* %y to i8*
  %3 = bitcast [2000 x double]* %z to i8*
  br label %for.body

for.body:                                         ; preds = %for.inc47.for.body_crit_edge, %for.body.lr.ph
  %4 = phi double [ %mul5, %for.inc47.for.body_crit_edge ], [ 1.000000e+00, %for.body.lr.ph ]
  %5 = phi double [ %div4748, %for.inc47.for.body_crit_edge ], [ %sub3, %for.body.lr.ph ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.inc47.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvar = phi i32 [ %indvar.next, %for.inc47.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %6 = zext i32 %indvar to i64
  %7 = add nuw nsw i64 %6, 1
  %8 = zext i32 %indvar to i64
  %9 = shl nuw nsw i64 %8, 3
  %10 = add nuw nsw i64 %9, 8
  %mul = fmul double %5, %5
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %4, %sub4
  %cmp710 = icmp sgt i64 %indvars.iv41, 0
  br i1 %cmp710, label %for.inc.preheader, label %for.end.thread

for.inc.preheader:                                ; preds = %for.body
  %11 = zext i32 %indvar to i64
  %12 = add nuw nsw i64 %11, 1
  %sub9 = add nsw i64 %indvars.iv41, -1
  %wide.trip.count = zext i32 %indvar to i64
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol, %for.inc.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %add16.prol = phi double [ %add.prol, %for.inc.prol ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol ], [ %xtraiter, %for.inc.prol.preheader ]
  %sub10.prol = sub nsw i64 %sub9, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %sub10.prol
  %13 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %14 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %13, %14
  %add.prol = fadd double %add16.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader, %for.inc.prol.loopexit.unr-lcssa
  %add.lcssa.unr = phi double [ undef, %for.inc.preheader ], [ %add.prol, %for.inc.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.unr-lcssa ]
  %add16.unr = phi double [ 0.000000e+00, %for.inc.preheader ], [ %add.prol, %for.inc.prol.loopexit.unr-lcssa ]
  %15 = icmp ult i32 %indvar, 3
  br i1 %15, label %for.inc32.lr.ph, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.end.thread:                                   ; preds = %for.body
  %arrayidx1643 = getelementptr inbounds double, double* %r, i64 %indvars.iv41
  %16 = load double, double* %arrayidx1643, align 8
  %add1744 = fadd double %16, 0.000000e+00
  %sub1845 = fsub double -0.000000e+00, %add1744
  %div46 = fdiv double %sub1845, %mul5
  br label %for.inc47

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc.preheader.new ], [ %indvars.iv.next.3, %for.inc ]
  %add16 = phi double [ %add16.unr, %for.inc.preheader.new ], [ %add.3, %for.inc ]
  %sub10 = sub nsw i64 %sub9, %indvars.iv
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %sub10
  %17 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %18 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %17, %18
  %add = fadd double %add16, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %sub10.1 = sub nsw i64 %sub9, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %sub10.1
  %19 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %20 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %19, %20
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %sub10.2 = sub nsw i64 %sub9, %indvars.iv.next.1
  %arrayidx11.2 = getelementptr inbounds double, double* %r, i64 %sub10.2
  %21 = load double, double* %arrayidx11.2, align 8
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %22 = load double, double* %arrayidx13.2, align 8
  %mul14.2 = fmul double %21, %22
  %add.2 = fadd double %add.1, %mul14.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %sub10.3 = sub nsw i64 %sub9, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %sub10.3
  %23 = load double, double* %arrayidx11.3, align 8
  %arrayidx13.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %24 = load double, double* %arrayidx13.3, align 8
  %mul14.3 = fmul double %23, %24
  %add.3 = fadd double %add.2, %mul14.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count
  br i1 %exitcond.3, label %for.inc32.lr.ph.unr-lcssa, label %for.inc

for.inc32.lr.ph.unr-lcssa:                        ; preds = %for.inc
  br label %for.inc32.lr.ph

for.inc32.lr.ph:                                  ; preds = %for.inc.prol.loopexit, %for.inc32.lr.ph.unr-lcssa
  %add.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.inc32.lr.ph.unr-lcssa ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv41
  %25 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %25, %add.lcssa
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %min.iters.check = icmp ult i64 %7, 4
  br i1 %min.iters.check, label %for.inc32.preheader, label %min.iters.checked

for.inc32.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.inc32.lr.ph
  %indvars.iv28.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.inc32.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.inc32

min.iters.checked:                                ; preds = %for.inc32.lr.ph
  %n.vec = and i64 %7, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc32.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert6 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat7 = shufflevector <2 x double> %broadcast.splatinsert6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %26 = getelementptr inbounds double, double* %y, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load2 = load <2 x double>, <2 x double>* %29, align 8
  %30 = sub nsw i64 %sub9, %index
  %31 = getelementptr inbounds double, double* %y, i64 %30
  %32 = getelementptr double, double* %31, i64 -1
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load3 = load <2 x double>, <2 x double>* %33, align 8
  %reverse = shufflevector <2 x double> %wide.load3, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %34 = getelementptr double, double* %31, i64 -2
  %35 = getelementptr double, double* %34, i64 -1
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load4 = load <2 x double>, <2 x double>* %36, align 8
  %reverse5 = shufflevector <2 x double> %wide.load4, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %37 = fmul <2 x double> %broadcast.splat7, %reverse
  %38 = fmul <2 x double> %broadcast.splat7, %reverse5
  %39 = fadd <2 x double> %wide.load, %37
  %40 = fadd <2 x double> %wide.load2, %38
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %39, <2 x double>* %42, align 16
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %40, <2 x double>* %44, align 16
  %index.next = add i64 %index, 4
  %45 = icmp eq i64 %index.next, %n.vec
  br i1 %45, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %7, %n.vec
  br i1 %cmp.n, label %for.inc42.lr.ph, label %for.inc32.preheader

for.inc42.lr.ph.loopexit:                         ; preds = %for.inc32
  br label %for.inc42.lr.ph

for.inc42.lr.ph:                                  ; preds = %for.inc42.lr.ph.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* nonnull %3, i64 %10, i32 8, i1 false)
  br label %for.inc47

for.inc32:                                        ; preds = %for.inc32.preheader, %for.inc32
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc32 ], [ %indvars.iv28.ph, %for.inc32.preheader ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv28
  %46 = load double, double* %arrayidx23, align 8
  %sub25 = sub nsw i64 %sub9, %indvars.iv28
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %sub25
  %47 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %47
  %add29 = fadd double %46, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv28
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond33 = icmp eq i64 %indvars.iv28, %wide.trip.count
  br i1 %exitcond33, label %for.inc42.lr.ph.loopexit, label %for.inc32, !llvm.loop !6

for.inc47:                                        ; preds = %for.end.thread, %for.inc42.lr.ph
  %div4748 = phi double [ %div, %for.inc42.lr.ph ], [ %div46, %for.end.thread ]
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv41
  store double %div4748, double* %arrayidx46, align 8
  %indvars.iv.next42 = add i64 %indvars.iv41, 1
  %cmp = icmp slt i64 %indvars.iv.next42, 2000
  br i1 %cmp, label %for.inc47.for.body_crit_edge, label %for.end49

for.inc47.for.body_crit_edge:                     ; preds = %for.inc47
  %indvar.next = add i32 %indvar, 1
  br label %for.body

for.end49:                                        ; preds = %for.inc47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
