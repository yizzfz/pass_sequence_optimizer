; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br i1 true, label %for.body.lr.ph, label %for.end29

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.lr.ph.for.body.us_crit_edge, label %for.body.lr.ph.for.body_crit_edge

for.body.lr.ph.for.body_crit_edge:                ; preds = %for.body.lr.ph
  br label %for.body

for.body.lr.ph.for.body.us_crit_edge:             ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond11.for.inc27_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.cond11.for.inc27_crit_edge.us ], [ 0, %for.body.lr.ph.for.body.us_crit_edge ]
  %indvars.iv12 = phi i32 [ %indvars.iv.next13, %for.cond11.for.inc27_crit_edge.us ], [ -1, %for.body.lr.ph.for.body.us_crit_edge ]
  %0 = add i64 %indvars.iv20, 4294967295
  %1 = and i64 %0, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp21.us, label %for.body3.us.preheader, label %for.end.us

for.body3.us.preheader:                           ; preds = %for.body.us
  %wide.trip.count = zext i32 %indvars.iv12 to i64
  %2 = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %2, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.preheader, label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.preheader:                      ; preds = %for.body3.us.preheader
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader
  %3 = trunc i64 %indvars.iv20 to i32
  %rem.us.prol = srem i32 %3, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.us.preheader, %for.body3.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.us.preheader ]
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %for.end.us.loopexit, label %for.body3.us.preheader.new

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.end.us.loopexit.unr-lcssa:                    ; preds = %for.body3.us
  br label %for.end.us.loopexit

for.end.us.loopexit:                              ; preds = %for.body3.us.prol.loopexit, %for.end.us.loopexit.unr-lcssa
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv20
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.end.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.body14.us ], [ 0, %for.end.us ]
  %5 = sub nsw i64 %indvars.iv20, %indvars.iv14
  %6 = add i64 1200, %5
  %7 = trunc i64 %6 to i32
  %rem16.us = srem i32 %7, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, 1.200000e+03
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv14
  store double %div19.us, double* %arrayidx23.us, align 8
  %exitcond19 = icmp eq i64 %indvars.iv14, 1199
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  br i1 %exitcond19, label %for.cond11.for.inc27_crit_edge.us, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.1, %for.body3.us ]
  %8 = add nuw nsw i64 %indvars.iv20, %indvars.iv
  %9 = trunc i64 %8 to i32
  %rem.us = srem i32 %9, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = add nuw nsw i64 %indvars.iv20, %indvars.iv.next
  %11 = trunc i64 %10 to i32
  %rem.us.1 = srem i32 %11, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, 1.000000e+03
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.us.loopexit.unr-lcssa, label %for.body3.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.body14.us
  %indvars.iv.next21 = add nuw i64 %indvars.iv20, 1
  %cmp.us = icmp slt i64 %indvars.iv.next21, 1000
  %indvars.iv.next13 = add nsw i32 %indvars.iv12, 1
  br i1 %cmp.us, label %for.body.us, label %for.end29.loopexit

for.body:                                         ; preds = %for.end, %for.body.lr.ph.for.body_crit_edge
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.end ], [ 0, %for.body.lr.ph.for.body_crit_edge ]
  %indvars.iv25 = phi i32 [ %indvars.iv.next26, %for.end ], [ -1, %for.body.lr.ph.for.body_crit_edge ]
  %12 = add i64 %indvars.iv29, 4294967295
  %13 = and i64 %12, 4294967295
  %cmp21 = icmp sgt i64 %indvars.iv29, 0
  br i1 %cmp21, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.body
  %wide.trip.count27 = zext i32 %indvars.iv25 to i64
  %14 = and i64 %12, 1
  %lcmp.mod35 = icmp eq i64 %14, 0
  br i1 %lcmp.mod35, label %for.body3.prol.preheader, label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader
  %15 = trunc i64 %indvars.iv29 to i32
  %rem.prol = srem i32 %15, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader, %for.body3.prol
  %indvars.iv22.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.preheader ]
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  %16 = icmp eq i64 %13, 0
  br i1 %16, label %for.end.loopexit, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr.ph, %for.body3.preheader.new ], [ %indvars.iv.next23.1, %for.body3 ]
  %17 = add nuw nsw i64 %indvars.iv29, %indvars.iv22
  %18 = trunc i64 %17 to i32
  %rem = srem i32 %18, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv22
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %19 = add nuw nsw i64 %indvars.iv29, %indvars.iv.next23
  %20 = trunc i64 %19 to i32
  %rem.1 = srem i32 %20, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.000000e+03
  %arrayidx6.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv.next23
  store double %div.1, double* %arrayidx6.1, align 8
  %exitcond28.1 = icmp eq i64 %indvars.iv.next23, %wide.trip.count27
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  br i1 %exitcond28.1, label %for.end.loopexit.unr-lcssa, label %for.body3

for.end.loopexit.unr-lcssa:                       ; preds = %for.body3
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body3.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv29
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next30 = add nuw i64 %indvars.iv29, 1
  %cmp = icmp slt i64 %indvars.iv.next30, 1000
  %indvars.iv.next26 = add nsw i32 %indvars.iv25, 1
  br i1 %cmp, label %for.body, label %for.end29.loopexit33

for.end29.loopexit:                               ; preds = %for.cond11.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit33:                             ; preds = %for.end
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit33, %for.end29.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  br i1 true, label %for.body.lr.ph.for.body.us_crit_edge, label %for.end32

for.body.lr.ph.for.body.us_crit_edge:             ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc30_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond1.for.inc30_crit_edge.us ], [ 0, %for.body.lr.ph.for.body.us_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond1.for.inc30_crit_edge.us ], [ 1, %for.body.lr.ph.for.body.us_crit_edge ]
  %sext = shl i64 %indvars.iv, 32
  %0 = ashr exact i64 %sext, 32
  %indvars.iv.next23 = add nuw i64 %indvars.iv22, 1
  %1 = sub nsw i64 1000, %0
  %2 = icmp slt i64 %indvars.iv.next23, 1000
  %xtraiter = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %3 = icmp eq i64 999, %0
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %0, i64 %indvars.iv22
  %indvars.iv.next17.prol = add nsw i64 %0, 1
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.end.us, %for.body.us
  %indvars.iv20 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next21, %for.end.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv20
  %.pre = load double, double* %arrayidx16.us, align 8
  br i1 %2, label %for.body6.us.preheader, label %for.end.us

for.body6.us.preheader:                           ; preds = %for.body3.us
  br i1 %lcmp.mod, label %for.body6.us.prol.loopexit.unr-lcssa, label %for.body6.us.prol.preheader

for.body6.us.prol.preheader:                      ; preds = %for.body6.us.preheader
  br label %for.body6.us.prol

for.body6.us.prol:                                ; preds = %for.body6.us.prol.preheader
  %4 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %0, i64 %indvars.iv20
  %5 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %4, %5
  %add17.us.prol = fadd double %.pre, %mul.us.prol
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.body6.us.prol.loopexit.unr-lcssa

for.body6.us.prol.loopexit.unr-lcssa:             ; preds = %for.body6.us.preheader, %for.body6.us.prol
  %add17.us.lcssa.unr.ph = phi double [ %add17.us.prol, %for.body6.us.prol ], [ undef, %for.body6.us.preheader ]
  %indvars.iv16.unr.ph = phi i64 [ %indvars.iv.next17.prol, %for.body6.us.prol ], [ %0, %for.body6.us.preheader ]
  %.unr.ph = phi double [ %add17.us.prol, %for.body6.us.prol ], [ %.pre, %for.body6.us.preheader ]
  br label %for.body6.us.prol.loopexit

for.body6.us.prol.loopexit:                       ; preds = %for.body6.us.prol.loopexit.unr-lcssa
  br i1 %3, label %for.end.us.loopexit, label %for.body6.us.preheader.new

for.body6.us.preheader.new:                       ; preds = %for.body6.us.prol.loopexit
  br label %for.body6.us

for.end.us.loopexit.unr-lcssa:                    ; preds = %for.body6.us
  br label %for.end.us.loopexit

for.end.us.loopexit:                              ; preds = %for.body6.us.prol.loopexit, %for.end.us.loopexit.unr-lcssa
  %add17.us.lcssa = phi double [ %add17.us.lcssa.unr.ph, %for.body6.us.prol.loopexit ], [ %add17.us.1, %for.end.us.loopexit.unr-lcssa ]
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body3.us
  %6 = phi double [ %.pre, %for.body3.us ], [ %add17.us.lcssa, %for.end.us.loopexit ]
  %mul22.us = fmul double %6, %alpha
  store double %mul22.us, double* %arrayidx16.us, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond25, label %for.cond1.for.inc30_crit_edge.us, label %for.body3.us

for.body6.us:                                     ; preds = %for.body6.us, %for.body6.us.preheader.new
  %indvars.iv16 = phi i64 [ %indvars.iv16.unr.ph, %for.body6.us.preheader.new ], [ %indvars.iv.next17.1, %for.body6.us ]
  %7 = phi double [ %.unr.ph, %for.body6.us.preheader.new ], [ %add17.us.1, %for.body6.us ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv22
  %8 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv16, i64 %indvars.iv20
  %9 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %8, %9
  %add17.us = fadd double %7, %mul.us
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next17, i64 %indvars.iv22
  %10 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next17, i64 %indvars.iv20
  %11 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %10, %11
  %add17.us.1 = fadd double %add17.us, %mul.us.1
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next17, 999
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  br i1 %exitcond.1, label %for.end.us.loopexit.unr-lcssa, label %for.body6.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.end.us
  %indvars.iv.next = add nsw i64 %0, 1
  br i1 %2, label %for.body.us, label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond1.for.inc30_crit_edge.us
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.body.lr.ph.for.body.us_crit_edge, label %for.end12

for.body.lr.ph.for.body.us_crit_edge:             ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv9 = phi i64 [ 0, %for.body.lr.ph.for.body.us_crit_edge ], [ %indvars.iv.next10, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv9, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond12, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
