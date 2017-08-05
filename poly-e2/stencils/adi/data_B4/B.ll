; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay6 = bitcast i8* %call2 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call3 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %arraydecay, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1000 x double]* nocapture %u) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %for.end9

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count8 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next6, %for.cond1.for.inc7_crit_edge.us ]
  %2 = add nsw i64 %indvars.iv5, %0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.cond1.preheader.us
  %3 = trunc i64 %2 to i32
  %conv.us.prol = sitofp i32 %3 to double
  %div.us.prol = fdiv double %conv.us.prol, %conv4
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv5, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.cond1.preheader.us, %for.inc.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %1, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %4 = trunc i64 %2 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.us.preheader ], [ %indvars.iv.next.1, %for.inc.us ]
  %5 = trunc i64 %indvars.iv to i32
  %sub.us = sub i32 %4, %5
  %conv.us = sitofp i32 %sub.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv5, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = trunc i64 %indvars.iv.next to i32
  %sub.us.1 = sub i32 %4, %6
  %conv.us.1 = sitofp i32 %sub.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, %conv4
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count8
  br i1 %exitcond.1, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.inc.us

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.inc.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %for.inc.us.prol.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count8
  br i1 %exitcond, label %for.end9.loopexit, label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32 %tsteps, i32 %n, [1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* nocapture %p, [1000 x double]* nocapture %q) unnamed_addr #2 {
entry:
  %conv = sitofp i32 %n to double
  %div = fdiv double 1.000000e+00, %conv
  %conv3 = sitofp i32 %tsteps to double
  %div4 = fdiv double 1.000000e+00, %conv3
  %mul = fmul double %div4, 2.000000e+00
  %mul5 = fmul double %div, %div
  %div6 = fdiv double %mul, %mul5
  %div9 = fdiv double %div4, %mul5
  %div10 = fmul double %div6, -5.000000e-01
  %add = fadd double %div6, 1.000000e+00
  %div12 = fmul double %div9, -5.000000e-01
  %add13 = fadd double %div9, 1.000000e+00
  %cmp13 = icmp slt i32 %tsteps, 1
  br i1 %cmp13, label %for.end239, label %for.cond15.preheader.lr.ph

for.cond15.preheader.lr.ph:                       ; preds = %entry
  %sub16 = add nsw i32 %n, -1
  %cmp175 = icmp sgt i32 %sub16, 1
  %idxprom90 = sext i32 %sub16 to i64
  %sub94 = add nsw i32 %n, -2
  %cmp963 = icmp sgt i32 %n, 2
  %sub35 = fsub double -0.000000e+00, %div10
  %mul55 = fmul double %div12, 2.000000e+00
  %add56 = fadd double %mul55, 1.000000e+00
  %sub145 = fsub double -0.000000e+00, %div12
  %mul165 = fmul double %div10, 2.000000e+00
  %add166 = fadd double %mul165, 1.000000e+00
  %0 = sext i32 %sub94 to i64
  %wide.trip.count = zext i32 %sub16 to i64
  %xtraiter = and i32 %sub94, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 3
  %indvars.iv.next17.prol = add nsw i64 %0, -1
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc237.for.cond15.preheader_crit_edge, %for.cond15.preheader.lr.ph
  %t.014 = phi i32 [ 1, %for.cond15.preheader.lr.ph ], [ %inc238, %for.inc237.for.cond15.preheader_crit_edge ]
  br i1 %cmp175, label %for.body19.us.preheader, label %for.inc237

for.body19.us.preheader:                          ; preds = %for.cond15.preheader
  br label %for.body19.us

for.body19.us:                                    ; preds = %for.body19.us.preheader, %for.inc120.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.inc120.us ], [ 1, %for.body19.us.preheader ]
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv19
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %2 = bitcast double* %arrayidx20.us to i64*
  %3 = load i64, i64* %2, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19
  %4 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %3, i64* %4, align 8
  %5 = add nsw i64 %indvars.iv19, -1
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br label %for.inc.us

for.inc120.us.loopexit:                           ; preds = %for.inc118.us
  br label %for.inc120.us

for.inc120.us:                                    ; preds = %for.inc120.us.loopexit, %for.inc118.us.prol.loopexit, %for.cond30.for.end_crit_edge.us
  %exitcond23 = icmp eq i64 %indvars.iv.next20, %wide.trip.count
  br i1 %exitcond23, label %for.cond123.preheader, label %for.body19.us

for.inc118.us:                                    ; preds = %for.inc118.us.prol.loopexit.for.inc118.us_crit_edge, %for.inc118.us.for.inc118.us_crit_edge
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %for.inc118.us.for.inc118.us_crit_edge ], [ %indvars.iv16.unr.ph, %for.inc118.us.prol.loopexit.for.inc118.us_crit_edge ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %indvars.iv16
  %6 = load double, double* %arrayidx102.us, align 8
  %7 = add nsw i64 %indvars.iv16, 1
  %arrayidx107.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %7, i64 %indvars.iv19
  %8 = load double, double* %arrayidx107.us, align 8
  %mul108.us = fmul double %6, %8
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %indvars.iv16
  %9 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %9
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv16, i64 %indvars.iv19
  store double %add113.us, double* %arrayidx117.us, align 8
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, -1
  %arrayidx102.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %indvars.iv.next17
  %10 = load double, double* %arrayidx102.us.1, align 8
  %mul108.us.1 = fmul double %10, %add113.us
  %arrayidx112.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %indvars.iv.next17
  %11 = load double, double* %arrayidx112.us.1, align 8
  %add113.us.1 = fadd double %mul108.us.1, %11
  %arrayidx117.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next17, i64 %indvars.iv19
  store double %add113.us.1, double* %arrayidx117.us.1, align 8
  %cmp96.us.1 = icmp sgt i64 %indvars.iv.next17, 1
  br i1 %cmp96.us.1, label %for.inc118.us.for.inc118.us_crit_edge, label %for.inc120.us.loopexit

for.inc118.us.for.inc118.us_crit_edge:            ; preds = %for.inc118.us
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, -2
  br label %for.inc118.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body19.us
  %indvars.iv = phi i64 [ 1, %for.body19.us ], [ %indvars.iv.next, %for.inc.us ]
  %12 = add nsw i64 %indvars.iv, -1
  %arrayidx40.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %12
  %13 = load double, double* %arrayidx40.us, align 8
  %mul41.us = fmul double %div10, %13
  %add42.us = fadd double %add, %mul41.us
  %div43.us = fdiv double %sub35, %add42.us
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %indvars.iv
  store double %div43.us, double* %arrayidx47.us, align 8
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %5
  %14 = load double, double* %arrayidx53.us, align 8
  %15 = fmul double %div12, %14
  %arrayidx60.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %indvars.iv19
  %16 = load double, double* %arrayidx60.us, align 8
  %mul61.us = fmul double %add56, %16
  %add62.us = fsub double %mul61.us, %15
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %indvars.iv.next20
  %17 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %div12, %17
  %sub69.us = fsub double %add62.us, %mul68.us
  %arrayidx74.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %12
  %18 = load double, double* %arrayidx74.us, align 8
  %mul75.us = fmul double %div10, %18
  %sub76.us = fsub double %sub69.us, %mul75.us
  %div84.us = fdiv double %sub76.us, %add42.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %indvars.iv
  store double %div84.us, double* %arrayidx88.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond30.for.end_crit_edge.us, label %for.inc.us

for.cond30.for.end_crit_edge.us:                  ; preds = %for.inc.us
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %idxprom90, i64 %indvars.iv19
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br i1 %cmp963, label %for.inc118.us.preheader, label %for.inc120.us

for.inc118.us.preheader:                          ; preds = %for.cond30.for.end_crit_edge.us
  br i1 %lcmp.mod, label %for.inc118.us.prol.loopexit, label %for.inc118.us.prol

for.inc118.us.prol:                               ; preds = %for.inc118.us.preheader
  %arrayidx102.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %0
  %19 = load double, double* %arrayidx102.us.prol, align 8
  %arrayidx112.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %0
  %20 = load double, double* %arrayidx112.us.prol, align 8
  %add113.us.prol = fadd double %19, %20
  %arrayidx117.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %0, i64 %indvars.iv19
  store double %add113.us.prol, double* %arrayidx117.us.prol, align 8
  br label %for.inc118.us.prol.loopexit

for.inc118.us.prol.loopexit:                      ; preds = %for.inc118.us.preheader, %for.inc118.us.prol
  %indvars.iv16.unr.ph = phi i64 [ %indvars.iv.next17.prol, %for.inc118.us.prol ], [ %0, %for.inc118.us.preheader ]
  br i1 %1, label %for.inc120.us, label %for.inc118.us.prol.loopexit.for.inc118.us_crit_edge

for.inc118.us.prol.loopexit.for.inc118.us_crit_edge: ; preds = %for.inc118.us.prol.loopexit
  br label %for.inc118.us

for.cond123.preheader:                            ; preds = %for.inc120.us
  br i1 true, label %for.body127.us.preheader, label %for.cond123.preheader.for.inc237_crit_edge

for.body127.us.preheader:                         ; preds = %for.cond123.preheader
  br label %for.body127.us

for.cond123.preheader.for.inc237_crit_edge:       ; preds = %for.cond123.preheader
  br label %for.inc237

for.body127.us:                                   ; preds = %for.body127.us.preheader, %for.inc234.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc234.us ], [ 1, %for.body127.us.preheader ]
  %arrayidx129.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx129.us, i64 0, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %21 = bitcast [1000 x double]* %arrayidx129.us to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34
  %23 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %22, i64* %23, align 8
  %24 = add nsw i64 %indvars.iv34, -1
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  br label %for.inc199.us

for.inc234.us.loopexit:                           ; preds = %for.inc231.us
  br label %for.inc234.us

for.inc234.us:                                    ; preds = %for.inc234.us.loopexit, %for.inc231.us.prol.loopexit, %for.cond140.for.end201_crit_edge.us
  %exitcond38 = icmp eq i64 %indvars.iv.next35, %wide.trip.count
  br i1 %exitcond38, label %for.inc237.loopexit, label %for.body127.us

for.inc231.us:                                    ; preds = %for.inc231.us.prol.loopexit.for.inc231.us_crit_edge, %for.inc231.us.for.inc231.us_crit_edge
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %for.inc231.us.for.inc231.us_crit_edge ], [ %indvars.iv29.unr.ph, %for.inc231.us.prol.loopexit.for.inc231.us_crit_edge ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %indvars.iv29
  %25 = load double, double* %arrayidx215.us, align 8
  %26 = add nsw i64 %indvars.iv29, 1
  %arrayidx220.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %26
  %27 = load double, double* %arrayidx220.us, align 8
  %mul221.us = fmul double %25, %27
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %indvars.iv29
  %28 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %28
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %indvars.iv29
  store double %add226.us, double* %arrayidx230.us, align 8
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, -1
  %arrayidx215.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %indvars.iv.next30
  %29 = load double, double* %arrayidx215.us.1, align 8
  %mul221.us.1 = fmul double %29, %add226.us
  %arrayidx225.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %indvars.iv.next30
  %30 = load double, double* %arrayidx225.us.1, align 8
  %add226.us.1 = fadd double %mul221.us.1, %30
  %arrayidx230.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %indvars.iv.next30
  store double %add226.us.1, double* %arrayidx230.us.1, align 8
  %cmp209.us.1 = icmp sgt i64 %indvars.iv.next30, 1
  br i1 %cmp209.us.1, label %for.inc231.us.for.inc231.us_crit_edge, label %for.inc234.us.loopexit

for.inc231.us.for.inc231.us_crit_edge:            ; preds = %for.inc231.us
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, -2
  br label %for.inc231.us

for.inc199.us:                                    ; preds = %for.inc199.us, %for.body127.us
  %indvars.iv24 = phi i64 [ 1, %for.body127.us ], [ %indvars.iv.next25, %for.inc199.us ]
  %31 = add nsw i64 %indvars.iv24, -1
  %arrayidx150.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %31
  %32 = load double, double* %arrayidx150.us, align 8
  %mul151.us = fmul double %div12, %32
  %add152.us = fadd double %add13, %mul151.us
  %div153.us = fdiv double %sub145, %add152.us
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %indvars.iv24
  store double %div153.us, double* %arrayidx157.us, align 8
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %24, i64 %indvars.iv24
  %33 = load double, double* %arrayidx163.us, align 8
  %34 = fmul double %div10, %33
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv34, i64 %indvars.iv24
  %35 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %add166, %35
  %add172.us = fsub double %mul171.us, %34
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next35, i64 %indvars.iv24
  %36 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %div10, %36
  %sub179.us = fsub double %add172.us, %mul178.us
  %arrayidx184.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %31
  %37 = load double, double* %arrayidx184.us, align 8
  %mul185.us = fmul double %div12, %37
  %sub186.us = fsub double %sub179.us, %mul185.us
  %div194.us = fdiv double %sub186.us, %add152.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %indvars.iv24
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, %wide.trip.count
  br i1 %exitcond28, label %for.cond140.for.end201_crit_edge.us, label %for.inc199.us

for.cond140.for.end201_crit_edge.us:              ; preds = %for.inc199.us
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %idxprom90
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br i1 %cmp963, label %for.inc231.us.preheader, label %for.inc234.us

for.inc231.us.preheader:                          ; preds = %for.cond140.for.end201_crit_edge.us
  br i1 %lcmp.mod, label %for.inc231.us.prol.loopexit, label %for.inc231.us.prol

for.inc231.us.prol:                               ; preds = %for.inc231.us.preheader
  %arrayidx215.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %0
  %38 = load double, double* %arrayidx215.us.prol, align 8
  %arrayidx225.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %0
  %39 = load double, double* %arrayidx225.us.prol, align 8
  %add226.us.prol = fadd double %38, %39
  %arrayidx230.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %0
  store double %add226.us.prol, double* %arrayidx230.us.prol, align 8
  br label %for.inc231.us.prol.loopexit

for.inc231.us.prol.loopexit:                      ; preds = %for.inc231.us.preheader, %for.inc231.us.prol
  %indvars.iv29.unr.ph = phi i64 [ %indvars.iv.next17.prol, %for.inc231.us.prol ], [ %0, %for.inc231.us.preheader ]
  br i1 %1, label %for.inc234.us, label %for.inc231.us.prol.loopexit.for.inc231.us_crit_edge

for.inc231.us.prol.loopexit.for.inc231.us_crit_edge: ; preds = %for.inc231.us.prol.loopexit
  br label %for.inc231.us

for.inc237.loopexit:                              ; preds = %for.inc234.us
  br label %for.inc237

for.inc237:                                       ; preds = %for.inc237.loopexit, %for.cond123.preheader.for.inc237_crit_edge, %for.cond15.preheader
  %exitcond39 = icmp eq i32 %t.014, %tsteps
  br i1 %exitcond39, label %for.end239.loopexit, label %for.inc237.for.cond15.preheader_crit_edge

for.inc237.for.cond15.preheader_crit_edge:        ; preds = %for.inc237
  %inc238 = add nuw nsw i32 %t.014, 1
  br label %for.cond15.preheader

for.end239.loopexit:                              ; preds = %for.inc237
  br label %for.end239

for.end239:                                       ; preds = %for.end239.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1000 x double]* nocapture readonly %u) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
