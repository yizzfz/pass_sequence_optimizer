; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1200 x double]*
  %2 = bitcast i8* %call2 to [1200 x double]*
  %3 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2, double* %3)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2, double* %3)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %tmax, 0
  br i1 %cmp8, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  %0 = sext i32 %tmax to i64
  %1 = add nsw i64 %0, -1
  %xtraiter = and i64 %0, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol, %for.inc.prol.preheader
  %indvars.iv17.prol = phi i64 [ 0, %for.inc.prol.preheader ], [ %indvars.iv.next18.prol, %for.inc.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc.prol.preheader ], [ %prol.iter.sub, %for.inc.prol ]
  %2 = trunc i64 %indvars.iv17.prol to i32
  %conv.prol = sitofp i32 %2 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv17.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next18.prol = add nsw i64 %indvars.iv17.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol.loopexit.unr-lcssa
  %indvars.iv17.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next18.prol, %for.inc.prol.loopexit.unr-lcssa ]
  %3 = icmp ult i64 %1, 7
  br i1 %3, label %for.end.loopexit, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv17 = phi i64 [ %indvars.iv17.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next18.7, %for.inc ]
  %4 = trunc i64 %indvars.iv17 to i32
  %conv = sitofp i32 %4 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv17
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %5 = trunc i64 %indvars.iv.next18 to i32
  %conv.1 = sitofp i32 %5 to double
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %6 = trunc i64 %indvars.iv.next18.1 to i32
  %conv.2 = sitofp i32 %6 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next18.2 = add nsw i64 %indvars.iv17, 3
  %7 = trunc i64 %indvars.iv.next18.2 to i32
  %conv.3 = sitofp i32 %7 to double
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next18.3 = add nsw i64 %indvars.iv17, 4
  %8 = trunc i64 %indvars.iv.next18.3 to i32
  %conv.4 = sitofp i32 %8 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next18.4 = add nsw i64 %indvars.iv17, 5
  %9 = trunc i64 %indvars.iv.next18.4 to i32
  %conv.5 = sitofp i32 %9 to double
  %arrayidx.5 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.4
  store double %conv.5, double* %arrayidx.5, align 8
  %indvars.iv.next18.5 = add nsw i64 %indvars.iv17, 6
  %10 = trunc i64 %indvars.iv.next18.5 to i32
  %conv.6 = sitofp i32 %10 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.5
  store double %conv.6, double* %arrayidx.6, align 8
  %indvars.iv.next18.6 = add nsw i64 %indvars.iv17, 7
  %11 = trunc i64 %indvars.iv.next18.6 to i32
  %conv.7 = sitofp i32 %11 to double
  %arrayidx.7 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.6
  store double %conv.7, double* %arrayidx.7, align 8
  %indvars.iv.next18.7 = add nsw i64 %indvars.iv17, 8
  %cmp.7 = icmp slt i64 %indvars.iv.next18.7, %0
  br i1 %cmp.7, label %for.inc, label %for.end.loopexit.unr-lcssa

for.end.loopexit.unr-lcssa:                       ; preds = %for.inc
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %cmp25 = icmp sgt i32 %nx, 0
  br i1 %cmp25, label %for.body4.lr.ph, label %for.end41

for.body4.lr.ph:                                  ; preds = %for.end
  %cmp63 = icmp sgt i32 %ny, 0
  %12 = sext i32 %nx to i64
  %conv30 = sitofp i32 %nx to double
  br i1 %cmp63, label %for.body4.us.preheader, label %for.end41

for.body4.us.preheader:                           ; preds = %for.body4.lr.ph
  %conv20 = sitofp i32 %ny to double
  %13 = sext i32 %ny to i64
  %div.us.v.i1.1 = insertelement <2 x double> undef, double %conv30, i32 0
  %div.us.v.i1.2 = insertelement <2 x double> %div.us.v.i1.1, double %conv20, i32 1
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.body4.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv15 = phi i64 [ 0, %for.body4.us.preheader ], [ %indvars.iv.next16, %for.cond5.for.inc39_crit_edge.us ]
  %14 = trunc i64 %indvars.iv15 to i32
  %conv16.us = sitofp i32 %14 to double
  %15 = insertelement <2 x double> undef, double %conv16.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.body4.us, %for.inc36.us
  %indvars.iv = phi i64 [ 0, %for.body4.us ], [ %indvars.iv.next, %for.inc36.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %16 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv15, i64 %indvars.iv
  %17 = add nuw nsw i64 %indvars.iv, 2
  %18 = trunc i64 %17 to i32
  %conv18.us = sitofp i32 %18 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, %div.us.v.i1.2
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv15, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %19 = add nuw nsw i64 %indvars.iv, 3
  %20 = trunc i64 %19 to i32
  %conv28.us = sitofp i32 %20 to double
  %mul29.us = fmul double %conv16.us, %conv28.us
  %div31.us = fdiv double %mul29.us, %conv30
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv15, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %cmp6.us = icmp slt i64 %indvars.iv.next, %13
  br i1 %cmp6.us, label %for.inc36.us, label %for.cond5.for.inc39_crit_edge.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next16, %12
  br i1 %cmp2.us, label %for.body4.us, label %for.end41.loopexit

for.end41.loopexit:                               ; preds = %for.cond5.for.inc39_crit_edge.us
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit, %for.body4.lr.ph, %for.end
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) unnamed_addr #2 {
entry:
  %cmp35 = icmp sgt i32 %tmax, 0
  br i1 %cmp35, label %for.body.lr.ph, label %for.end115

for.body.lr.ph:                                   ; preds = %entry
  %wide.trip.count.7 = zext i32 %ny to i64
  %sub70 = add nsw i32 %nx, -1
  %0 = sext i32 %ny to i64
  %sub74 = add nsw i64 %0, -1
  %1 = sext i32 %nx to i64
  %2 = sext i32 %tmax to i64
  %3 = add i32 %ny, -1
  %4 = and i32 %ny, 7
  %5 = add nsw i32 %4, -1
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, 1
  %8 = zext i32 %nx to i64
  %9 = icmp sgt i32 %ny, 0
  %lcmp.mod = icmp eq i32 %4, 0
  %10 = icmp ult i32 %3, 7
  %sunkaddr76 = ptrtoint double* %_fict_ to i64
  %11 = and i32 %ny, 1
  %lcmp.mod72 = icmp eq i32 %11, 0
  %12 = icmp eq i32 %ny, 2
  %wide.trip.count67 = zext i32 %sub70 to i64
  %13 = icmp sgt i64 %sub74, 1
  %smax = select i1 %13, i64 %sub74, i64 1
  %14 = add nuw nsw i64 %smax, 1
  %15 = add nsw i64 %wide.trip.count.7, -2
  %.not = icmp slt i32 %nx, 2
  %.not80 = icmp slt i32 %ny, 1
  %brmerge = or i1 %.not, %.not80
  %.not81 = icmp slt i32 %nx, 1
  %.not82 = icmp slt i32 %ny, 2
  %brmerge83 = or i1 %.not81, %.not82
  %brmerge86 = or i1 %.not, %.not82
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %smax, %n.vec
  %min.iters.check158 = icmp ult i32 %ny, 4
  %n.vec161 = and i64 %0, -4
  %cmp.zero162 = icmp eq i64 %n.vec161, 0
  %cmp.n181 = icmp eq i64 %0, %n.vec161
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc113
  %indvars.iv69 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next70, %for.inc113 ]
  br i1 %9, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.body
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %sunkaddr73 = shl i64 %indvars.iv69, 3
  %sunkaddr74 = add i64 %sunkaddr76, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i64*
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol ], [ %4, %for.inc.prol.preheader ]
  %16 = load i64, i64* %sunkaddr75, align 8
  %arrayidx6.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.prol
  %17 = bitcast double* %arrayidx6.prol to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !3

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %7, %for.inc.prol.loopexit.loopexit ]
  br i1 %10, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %sunkaddr77 = shl i64 %indvars.iv69, 3
  %sunkaddr78 = add i64 %sunkaddr76, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i64*
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %18 = load i64, i64* %sunkaddr79, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %19 = bitcast double* %arrayidx6 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = load i64, i64* %sunkaddr79, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %21 = bitcast double* %arrayidx6.1 to i64*
  store i64 %20, i64* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %22 = load i64, i64* %sunkaddr79, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx6.2 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %24 = load i64, i64* %sunkaddr79, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %25 = bitcast double* %arrayidx6.3 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %26 = load i64, i64* %sunkaddr79, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %27 = bitcast double* %arrayidx6.4 to i64*
  store i64 %26, i64* %27, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %28 = load i64, i64* %sunkaddr79, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %29 = bitcast double* %arrayidx6.5 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %30 = load i64, i64* %sunkaddr79, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %31 = bitcast double* %arrayidx6.6 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %32 = load i64, i64* %sunkaddr79, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %33 = bitcast double* %arrayidx6.7 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.body
  br i1 %brmerge, label %for.end36, label %for.body9.us.preheader

for.body9.us.preheader:                           ; preds = %for.end
  br label %for.body9.us

for.body9.us:                                     ; preds = %for.body9.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %34, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.body9.us.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.body9.us.preheader ]
  %34 = add i64 %indvar, 1
  %scevgep164 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %34, i64 0
  %scevgep166 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %34, i64 %0
  %scevgep168 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep170 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %34, i64 %0
  %35 = add nsw i64 %indvars.iv50, -1
  br i1 %min.iters.check158, label %for.inc31.us.preheader, label %min.iters.checked159

min.iters.checked159:                             ; preds = %for.body9.us
  br i1 %cmp.zero162, label %for.inc31.us.preheader, label %vector.memcheck176

vector.memcheck176:                               ; preds = %min.iters.checked159
  %bound0172 = icmp ult double* %scevgep164, %scevgep170
  %bound1173 = icmp ult double* %scevgep168, %scevgep166
  %found.conflict174 = and i1 %bound0172, %bound1173
  br i1 %found.conflict174, label %for.inc31.us.preheader, label %vector.body155.preheader

vector.body155.preheader:                         ; preds = %vector.memcheck176
  br label %vector.body155

vector.body155:                                   ; preds = %vector.body155.preheader, %vector.body155
  %index178 = phi i64 [ %index.next179, %vector.body155 ], [ 0, %vector.body155.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv50, i64 %index178
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load186 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !4, !noalias !7
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load187 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !4, !noalias !7
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv50, i64 %index178
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load188 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !7
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load189 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !7
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %35, i64 %index178
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load190 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !7
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load191 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !7
  %48 = fsub <2 x double> %wide.load188, %wide.load190
  %49 = fsub <2 x double> %wide.load189, %wide.load191
  %50 = fmul <2 x double> %48, <double 5.000000e-01, double 5.000000e-01>
  %51 = fmul <2 x double> %49, <double 5.000000e-01, double 5.000000e-01>
  %52 = fsub <2 x double> %wide.load186, %50
  %53 = fsub <2 x double> %wide.load187, %51
  store <2 x double> %52, <2 x double>* %37, align 8, !alias.scope !4, !noalias !7
  store <2 x double> %53, <2 x double>* %39, align 8, !alias.scope !4, !noalias !7
  %index.next179 = add i64 %index178, 4
  %54 = icmp eq i64 %index.next179, %n.vec161
  br i1 %54, label %middle.block156, label %vector.body155, !llvm.loop !9

middle.block156:                                  ; preds = %vector.body155
  br i1 %cmp.n181, label %for.cond10.for.inc34_crit_edge.us, label %for.inc31.us.preheader

for.inc31.us.preheader:                           ; preds = %middle.block156, %vector.memcheck176, %min.iters.checked159, %for.body9.us
  %indvars.iv48.ph = phi i64 [ 0, %vector.memcheck176 ], [ 0, %min.iters.checked159 ], [ 0, %for.body9.us ], [ %n.vec161, %middle.block156 ]
  %55 = sub nsw i64 %0, %indvars.iv48.ph
  %xtraiter = and i64 %55, 1
  %lcmp.mod193 = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod193, label %for.inc31.us.prol.loopexit.unr-lcssa, label %for.inc31.us.prol.preheader

for.inc31.us.prol.preheader:                      ; preds = %for.inc31.us.preheader
  %arrayidx16.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv50, i64 %indvars.iv48.ph
  %56 = load double, double* %arrayidx16.us.prol, align 8
  %arrayidx20.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv50, i64 %indvars.iv48.ph
  %57 = load double, double* %arrayidx20.us.prol, align 8
  %arrayidx24.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %35, i64 %indvars.iv48.ph
  %58 = load double, double* %arrayidx24.us.prol, align 8
  %sub25.us.prol = fsub double %57, %58
  %mul.us.prol = fmul double %sub25.us.prol, 5.000000e-01
  %sub26.us.prol = fsub double %56, %mul.us.prol
  store double %sub26.us.prol, double* %arrayidx16.us.prol, align 8
  %indvars.iv.next49.prol = or i64 %indvars.iv48.ph, 1
  br label %for.inc31.us.prol.loopexit.unr-lcssa

for.inc31.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc31.us.preheader, %for.inc31.us.prol.preheader
  %indvars.iv48.unr.ph = phi i64 [ %indvars.iv.next49.prol, %for.inc31.us.prol.preheader ], [ %indvars.iv48.ph, %for.inc31.us.preheader ]
  %59 = icmp eq i64 %sub74, %indvars.iv48.ph
  br i1 %59, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.inc31.us.preheader.new

for.inc31.us.preheader.new:                       ; preds = %for.inc31.us.prol.loopexit.unr-lcssa
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.inc31.us.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %for.inc31.us.preheader.new ], [ %indvars.iv.next49.1, %for.inc31.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv50, i64 %indvars.iv48
  %60 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv50, i64 %indvars.iv48
  %61 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %35, i64 %indvars.iv48
  %62 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %61, %62
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %60, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv50, i64 %indvars.iv.next49
  %63 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv50, i64 %indvars.iv.next49
  %64 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %35, i64 %indvars.iv.next49
  %65 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %64, %65
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %63, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next49.1, %0
  br i1 %exitcond87.1, label %for.cond10.for.inc34_crit_edge.us.loopexit.unr-lcssa, label %for.inc31.us, !llvm.loop !12

for.cond10.for.inc34_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.inc31.us
  br label %for.cond10.for.inc34_crit_edge.us.loopexit

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.inc31.us.prol.loopexit.unr-lcssa, %for.cond10.for.inc34_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit, %middle.block156
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %8
  br i1 %exitcond, label %for.end36.loopexit, label %for.body9.us

for.end36.loopexit:                               ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %for.end
  br i1 %brmerge83, label %for.end68, label %for.body39.us.preheader

for.body39.us.preheader:                          ; preds = %for.end36
  br label %for.body39.us

for.body39.us:                                    ; preds = %for.body39.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.body39.us.preheader ]
  %scevgep126 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 2
  %scevgep129 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 -1
  %scevgep132 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 2
  br i1 %lcmp.mod72, label %for.inc63.us.prol, label %for.inc63.us.prol.loopexit

for.inc63.us.prol:                                ; preds = %for.body39.us
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 1
  %66 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 1
  %67 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 0
  %68 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %67, %68
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %66, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  br label %for.inc63.us.prol.loopexit

for.inc63.us.prol.loopexit:                       ; preds = %for.inc63.us.prol, %for.body39.us
  %indvars.iv55.unr.ph = phi i64 [ 2, %for.inc63.us.prol ], [ 1, %for.body39.us ]
  br i1 %12, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us.preheader

for.inc63.us.preheader:                           ; preds = %for.inc63.us.prol.loopexit
  %69 = sub nsw i64 %15, %indvars.iv55.unr.ph
  %70 = lshr i64 %69, 1
  %71 = add nuw i64 %70, 1
  %min.iters.check117 = icmp ult i64 %71, 2
  br i1 %min.iters.check117, label %for.inc63.us.preheader192, label %min.iters.checked118

min.iters.checked118:                             ; preds = %for.inc63.us.preheader
  %n.mod.vf119 = and i64 %71, 1
  %n.vec120 = sub i64 %71, %n.mod.vf119
  %cmp.zero121 = icmp eq i64 %n.vec120, 0
  br i1 %cmp.zero121, label %for.inc63.us.preheader192, label %vector.memcheck139

vector.memcheck139:                               ; preds = %min.iters.checked118
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %indvars.iv55.unr.ph
  %72 = shl nuw i64 %70, 1
  %73 = add i64 %indvars.iv55.unr.ph, %72
  %scevgep127 = getelementptr double, double* %scevgep126, i64 %73
  %scevgep130 = getelementptr double, double* %scevgep129, i64 %indvars.iv55.unr.ph
  %scevgep133 = getelementptr double, double* %scevgep132, i64 %73
  %bound0135 = icmp ult double* %scevgep124, %scevgep133
  %bound1136 = icmp ult double* %scevgep130, %scevgep127
  %found.conflict137 = and i1 %bound0135, %bound1136
  %74 = add nuw nsw i64 %indvars.iv55.unr.ph, 2
  %75 = add i64 %74, %72
  %76 = shl nuw nsw i64 %n.mod.vf119, 1
  %ind.end = sub i64 %75, %76
  br i1 %found.conflict137, label %for.inc63.us.preheader192, label %vector.body114.preheader

vector.body114.preheader:                         ; preds = %vector.memcheck139
  br label %vector.body114

vector.body114:                                   ; preds = %vector.body114.preheader, %vector.body114
  %index141 = phi i64 [ %index.next142, %vector.body114 ], [ 0, %vector.body114.preheader ]
  %77 = shl i64 %index141, 1
  %offset.idx = or i64 %indvars.iv55.unr.ph, %77
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %offset.idx
  %79 = bitcast double* %78 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %79, align 8, !alias.scope !13, !noalias !16
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec148 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %offset.idx
  %81 = getelementptr double, double* %80, i64 -1
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec149 = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !16
  %strided.vec150 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec151 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = fsub <2 x double> %strided.vec151, %strided.vec150
  %84 = fmul <2 x double> %83, <double 5.000000e-01, double 5.000000e-01>
  %85 = fsub <2 x double> %strided.vec, %84
  %86 = add nuw nsw i64 %offset.idx, 1
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %86
  %89 = getelementptr double, double* %88, i64 -1
  %90 = bitcast double* %89 to <4 x double>*
  %wide.vec152 = load <4 x double>, <4 x double>* %90, align 8, !alias.scope !16
  %strided.vec153 = shufflevector <4 x double> %wide.vec152, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec154 = shufflevector <4 x double> %wide.vec152, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %91 = fsub <2 x double> %strided.vec154, %strided.vec153
  %92 = fmul <2 x double> %91, <double 5.000000e-01, double 5.000000e-01>
  %93 = fsub <2 x double> %strided.vec148, %92
  %94 = getelementptr double, double* %87, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %85, <2 x double> %93, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %95, align 8, !alias.scope !13, !noalias !16
  %index.next142 = add i64 %index141, 2
  %96 = icmp eq i64 %index.next142, %n.vec120
  br i1 %96, label %middle.block115, label %vector.body114, !llvm.loop !18

middle.block115:                                  ; preds = %vector.body114
  %cmp.n144 = icmp eq i64 %n.mod.vf119, 0
  br i1 %cmp.n144, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us.preheader192

for.inc63.us.preheader192:                        ; preds = %middle.block115, %vector.memcheck139, %min.iters.checked118, %for.inc63.us.preheader
  %indvars.iv55.ph = phi i64 [ %indvars.iv55.unr.ph, %vector.memcheck139 ], [ %indvars.iv55.unr.ph, %min.iters.checked118 ], [ %indvars.iv55.unr.ph, %for.inc63.us.preheader ], [ %ind.end, %middle.block115 ]
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us.preheader192, %for.inc63.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %for.inc63.us ], [ %indvars.iv55.ph, %for.inc63.us.preheader192 ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %indvars.iv55
  %97 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %indvars.iv55
  %98 = load double, double* %arrayidx50.us, align 8
  %99 = add nsw i64 %indvars.iv55, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %99
  %100 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %98, %100
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %97, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %indvars.iv.next56
  %101 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %indvars.iv.next56
  %102 = load double, double* %arrayidx50.us.1, align 8
  %103 = load double, double* %arrayidx50.us, align 8
  %sub56.us.1 = fsub double %102, %103
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %101, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count.7
  br i1 %exitcond59.1, label %for.cond40.for.inc66_crit_edge.us.loopexit, label %for.inc63.us, !llvm.loop !19

for.cond40.for.inc66_crit_edge.us.loopexit:       ; preds = %for.inc63.us
  br label %for.cond40.for.inc66_crit_edge.us

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.cond40.for.inc66_crit_edge.us.loopexit, %middle.block115, %for.inc63.us.prol.loopexit
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next61, %1
  br i1 %exitcond88, label %for.end68.loopexit, label %for.body39.us

for.end68.loopexit:                               ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.end68

for.end68:                                        ; preds = %for.end68.loopexit, %for.end36
  br i1 %brmerge86, label %for.inc113, label %for.body72.us.preheader

for.body72.us.preheader:                          ; preds = %for.end68
  br label %for.body72.us

for.body72.us:                                    ; preds = %for.body72.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv65 = phi i64 [ %104, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.body72.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv65, i64 0
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv65, i64 %smax
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 0
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %14
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv65, i64 0
  %104 = add i64 %indvars.iv65, 1
  %scevgep99 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %104, i64 %smax
  br i1 %min.iters.check, label %for.inc107.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body72.us
  br i1 %cmp.zero, label %for.inc107.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep95
  %bound1 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict = and i1 %bound0, %bound1
  %bound0101 = icmp ult double* %scevgep, %scevgep99
  %bound1102 = icmp ult double* %scevgep97, %scevgep91
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx = or i1 %found.conflict, %found.conflict103
  br i1 %conflict.rdx, label %for.inc107.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv65, i64 %index
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !20, !noalias !23
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !20, !noalias !23
  %109 = or i64 %index, 1
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %109
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !26
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !26
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %index
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !26
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !26
  %118 = fsub <2 x double> %wide.load106, %wide.load108
  %119 = fsub <2 x double> %wide.load107, %wide.load109
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %104, i64 %index
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !27
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !27
  %124 = fadd <2 x double> %118, %wide.load110
  %125 = fadd <2 x double> %119, %wide.load111
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv65, i64 %index
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !27
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !27
  %130 = fsub <2 x double> %124, %wide.load112
  %131 = fsub <2 x double> %125, %wide.load113
  %132 = fmul <2 x double> %130, <double 7.000000e-01, double 7.000000e-01>
  %133 = fmul <2 x double> %131, <double 7.000000e-01, double 7.000000e-01>
  %134 = fsub <2 x double> %wide.load, %132
  %135 = fsub <2 x double> %wide.load105, %133
  store <2 x double> %134, <2 x double>* %106, align 8, !alias.scope !20, !noalias !23
  store <2 x double> %135, <2 x double>* %108, align 8, !alias.scope !20, !noalias !23
  %index.next = add i64 %index, 4
  %136 = icmp eq i64 %index.next, %n.vec
  br i1 %136, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond73.for.inc110_crit_edge.us, label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body72.us
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body72.us ], [ %n.vec, %middle.block ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.preheader, %for.inc107.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc107.us ], [ %indvars.iv63.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv65, i64 %indvars.iv63
  %137 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %indvars.iv.next64
  %138 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %indvars.iv63
  %139 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %138, %139
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %104, i64 %indvars.iv63
  %140 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %140
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv65, i64 %indvars.iv63
  %141 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %141
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %137, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next64, %sub74
  br i1 %cmp75.us, label %for.inc107.us, label %for.cond73.for.inc110_crit_edge.us.loopexit, !llvm.loop !29

for.cond73.for.inc110_crit_edge.us.loopexit:      ; preds = %for.inc107.us
  br label %for.cond73.for.inc110_crit_edge.us

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.cond73.for.inc110_crit_edge.us.loopexit, %middle.block
  %exitcond68 = icmp eq i64 %104, %wide.trip.count67
  br i1 %exitcond68, label %for.inc113.loopexit, label %for.body72.us

for.inc113.loopexit:                              ; preds = %for.cond73.for.inc110_crit_edge.us
  br label %for.inc113

for.inc113:                                       ; preds = %for.inc113.loopexit, %for.end68
  %indvars.iv.next70 = add nsw i64 %indvars.iv69, 1
  %cmp = icmp slt i64 %indvars.iv.next70, %2
  br i1 %cmp, label %for.body, label %for.end115.loopexit

for.end115.loopexit:                              ; preds = %for.inc113
  br label %for.end115

for.end115:                                       ; preds = %for.end115.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nx, i32 %ny, [1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp29 = icmp sgt i32 %nx, 0
  br i1 %cmp29, label %for.body.lr.ph, label %for.end39.critedge

for.body.lr.ph:                                   ; preds = %entry
  %3 = zext i32 %ny to i64
  %cmp326 = icmp sgt i32 %ny, 0
  %4 = sext i32 %nx to i64
  br i1 %cmp326, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %5 = mul nsw i64 %indvars.iv58, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv53 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next54, %for.inc.us ]
  %6 = add nsw i64 %5, %indvars.iv53
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv58, i64 %indvars.iv53
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next54, %3
  br i1 %exitcond66, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, 1
  %cmp.us = icmp slt i64 %indvars.iv.next59, %4
  br i1 %cmp.us, label %for.body.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %for.body.lr.ph
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br i1 true, label %for.body18.lr.ph, label %for.end65.critedge

for.body18.lr.ph:                                 ; preds = %for.end12
  br i1 %cmp326, label %for.body18.us.preheader, label %for.end39

for.body18.us.preheader:                          ; preds = %for.body18.lr.ph
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us.preheader, %for.cond19.for.inc37_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond19.for.inc37_crit_edge.us ], [ 0, %for.body18.us.preheader ]
  %15 = mul nsw i64 %indvars.iv48, %4
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us, %for.body18.us
  %indvars.iv43 = phi i64 [ 0, %for.body18.us ], [ %indvars.iv.next44, %for.inc34.us ]
  %16 = add nsw i64 %15, %indvars.iv43
  %17 = trunc i64 %16 to i32
  %rem24.us = srem i32 %17, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %for.inc34.us

if.then26.us:                                     ; preds = %for.body21.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %for.inc34.us

for.inc34.us:                                     ; preds = %if.then26.us, %for.body21.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv48, i64 %indvars.iv43
  %20 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %3
  br i1 %exitcond, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %cmp17.us = icmp slt i64 %indvars.iv.next49, %4
  br i1 %cmp17.us, label %for.body18.us, label %for.end39.loopexit

for.end39.critedge:                               ; preds = %entry
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13.c = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15.c = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.end39

for.end39.loopexit:                               ; preds = %for.cond19.for.inc37_crit_edge.us
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.body18.lr.ph, %for.end39.critedge
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br i1 %cmp29, label %for.body44.lr.ph, label %for.end65

for.body44.lr.ph:                                 ; preds = %for.end39
  %27 = zext i32 %ny to i64
  %cmp4614 = icmp sgt i32 %ny, 0
  %28 = sext i32 %nx to i64
  br i1 %cmp4614, label %for.body44.us.preheader, label %for.end65

for.body44.us.preheader:                          ; preds = %for.body44.lr.ph
  br label %for.body44.us

for.body44.us:                                    ; preds = %for.body44.us.preheader, %for.cond45.for.inc63_crit_edge.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond45.for.inc63_crit_edge.us ], [ 0, %for.body44.us.preheader ]
  %29 = mul nsw i64 %indvars.iv40, %28
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.inc60.us, %for.body44.us
  %indvars.iv = phi i64 [ 0, %for.body44.us ], [ %indvars.iv.next, %for.inc60.us ]
  %30 = add nsw i64 %29, %indvars.iv
  %31 = trunc i64 %30 to i32
  %rem50.us = srem i32 %31, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %for.inc60.us

if.then52.us:                                     ; preds = %for.body47.us
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #5
  br label %for.inc60.us

for.inc60.us:                                     ; preds = %if.then52.us, %for.body47.us
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv40, i64 %indvars.iv
  %34 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next, %27
  br i1 %exitcond63, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %cmp43.us = icmp slt i64 %indvars.iv.next41, %28
  br i1 %cmp43.us, label %for.body44.us, label %for.end65.loopexit

for.end65.critedge:                               ; preds = %for.end12
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40.c = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41.c = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.end65

for.end65.loopexit:                               ; preds = %for.cond45.for.inc63_crit_edge.us
  br label %for.end65

for.end65:                                        ; preds = %for.end65.loopexit, %for.body44.lr.ph, %for.end65.critedge, %for.end39
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !22}
!26 = !{!24}
!27 = !{!25}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
