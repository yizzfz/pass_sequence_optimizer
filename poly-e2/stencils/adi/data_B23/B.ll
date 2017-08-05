; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
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
  tail call fastcc void @init_array([1000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay6 = bitcast i8* %call2 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call3 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %arraydecay, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
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
  tail call fastcc void @print_array([1000 x double]* %arraydecay)
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
define internal fastcc void @init_array([1000 x double]* nocapture %u) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %entry
  %indvars.iv14.us = phi i64 [ 0, %entry ], [ %indvars.iv.next11.us, %for.cond1.for.inc7_crit_edge.us ]
  %0 = add nuw nsw i64 %indvars.iv14.us, 1000
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv10.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.us.1, %for.inc.us ]
  %2 = sub nsw i64 0, %indvars.iv10.us
  %3 = trunc i64 %2 to i32
  %sub.us = add nsw i32 %1, %3
  %conv.us = sitofp i32 %sub.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv14.us, i64 %indvars.iv10.us
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next.us = or i64 %indvars.iv10.us, 1
  %4 = trunc i64 %indvars.iv10.us to i32
  %5 = xor i32 %4, -1
  %sub.us.1 = add nsw i32 %1, %5
  %conv.us.1 = sitofp i32 %sub.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, 1.000000e+03
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv14.us, i64 %indvars.iv.next.us
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv10.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 1000
  br i1 %exitcond.us.1, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next11.us, 1000
  br i1 %exitcond16, label %for.end9, label %for.cond1.preheader.us

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* nocapture %p, [1000 x double]* nocapture %q) unnamed_addr #2 {
entry:
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc237.for.cond15.preheader_crit_edge, %entry
  %storemerge145 = phi i32 [ 1, %entry ], [ %inc238, %for.inc237.for.cond15.preheader_crit_edge ]
  br label %for.body19.us

for.body19.us:                                    ; preds = %for.inc120.us, %for.cond15.preheader
  %indvars.iv124.us = phi i64 [ 1, %for.cond15.preheader ], [ %4, %for.inc120.us ]
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv124.us
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv124.us, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %0 = bitcast double* %arrayidx20.us to i64*
  %1 = load i64, i64* %0, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv124.us
  %2 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %1, i64* %2, align 8
  %3 = add nsw i64 %indvars.iv124.us, -1
  %4 = add nuw nsw i64 %indvars.iv124.us, 1
  br label %for.inc.us

for.inc120.us:                                    ; preds = %for.inc118.us
  %exitcond = icmp eq i64 %4, 999
  br i1 %exitcond, label %for.body127.us.preheader, label %for.body19.us

for.body127.us.preheader:                         ; preds = %for.inc120.us
  br label %for.body127.us

for.inc118.us:                                    ; preds = %for.inc118.us.for.inc118.us_crit_edge, %for.cond30.for.end_crit_edge.us
  %5 = phi double [ %add113.us, %for.inc118.us.for.inc118.us_crit_edge ], [ 1.000000e+00, %for.cond30.for.end_crit_edge.us ]
  %indvars.iv119.us = phi i64 [ %indvars.iv.next116.us, %for.inc118.us.for.inc118.us_crit_edge ], [ 998, %for.cond30.for.end_crit_edge.us ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv124.us, i64 %indvars.iv119.us
  %6 = load double, double* %arrayidx102.us, align 8
  %mul108.us = fmul double %6, %5
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv124.us, i64 %indvars.iv119.us
  %7 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %7
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv119.us, i64 %indvars.iv124.us
  store double %add113.us, double* %arrayidx117.us, align 8
  %cmp96.us = icmp sgt i64 %indvars.iv119.us, 1
  br i1 %cmp96.us, label %for.inc118.us.for.inc118.us_crit_edge, label %for.inc120.us

for.inc118.us.for.inc118.us_crit_edge:            ; preds = %for.inc118.us
  %indvars.iv.next116.us = add nsw i64 %indvars.iv119.us, -1
  br label %for.inc118.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body19.us
  %indvars.iv115.us = phi i64 [ 1, %for.body19.us ], [ %indvars.iv.next.us, %for.inc.us ]
  %8 = add nsw i64 %indvars.iv115.us, -1
  %arrayidx40.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv124.us, i64 %8
  %9 = load double, double* %arrayidx40.us, align 8
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv124.us, i64 %indvars.iv115.us
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv115.us, i64 %3
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv115.us, i64 %4
  %arrayidx74.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv124.us, i64 %8
  %add42.v.r1.us.lhs = fmul double %9, 0xC09F400000000001
  %add42.v.r1.us = fadd double %add42.v.r1.us.lhs, 0x40AF420000000001
  %div43.us = fdiv double 0x409F400000000001, %add42.v.r1.us
  store double %div43.us, double* %arrayidx47.us, align 8
  %10 = bitcast double* %arrayidx53.us to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %mul61.us = fmul <2 x double> %11, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1.us = extractelement <2 x double> %mul61.us, i32 0
  %mul61.v.r2.us = extractelement <2 x double> %mul61.us, i32 1
  %add62.us = fsub double %mul61.v.r2.us, %mul61.v.r1.us
  %12 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %12, 0xC08F400000000001
  %sub69.us = fsub double %add62.us, %mul68.us
  %13 = load double, double* %arrayidx74.us, align 8
  %mul75.us = fmul double %13, 0xC09F400000000001
  %sub76.us = fsub double %sub69.us, %mul75.us
  %div84.us = fdiv double %sub76.us, %add42.v.r1.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv124.us, i64 %indvars.iv115.us
  store double %div84.us, double* %arrayidx88.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv115.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 999
  br i1 %exitcond.us, label %for.cond30.for.end_crit_edge.us, label %for.inc.us

for.cond30.for.end_crit_edge.us:                  ; preds = %for.inc.us
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 999, i64 %indvars.iv124.us
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br label %for.inc118.us

for.body127.us:                                   ; preds = %for.body127.us.preheader, %for.inc234.us
  %indvars.iv142.us = phi i64 [ %18, %for.inc234.us ], [ 1, %for.body127.us.preheader ]
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv142.us, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv142.us, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %14 = bitcast double* %arrayidx130.us to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv142.us
  %16 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %15, i64* %16, align 8
  %17 = add nsw i64 %indvars.iv142.us, -1
  %18 = add nuw nsw i64 %indvars.iv142.us, 1
  br label %for.inc199.us

for.inc234.us:                                    ; preds = %for.inc231.us
  %exitcond150 = icmp eq i64 %18, 999
  br i1 %exitcond150, label %for.inc237, label %for.body127.us

for.inc231.us:                                    ; preds = %for.inc231.us.for.inc231.us_crit_edge, %for.cond140.for.end201_crit_edge.us
  %19 = phi double [ %add226.us, %for.inc231.us.for.inc231.us_crit_edge ], [ 1.000000e+00, %for.cond140.for.end201_crit_edge.us ]
  %indvars.iv137.us = phi i64 [ %indvars.iv.next134.us, %for.inc231.us.for.inc231.us_crit_edge ], [ 998, %for.cond140.for.end201_crit_edge.us ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv142.us, i64 %indvars.iv137.us
  %20 = load double, double* %arrayidx215.us, align 8
  %mul221.us = fmul double %20, %19
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv142.us, i64 %indvars.iv137.us
  %21 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %21
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv142.us, i64 %indvars.iv137.us
  store double %add226.us, double* %arrayidx230.us, align 8
  %cmp209.us = icmp sgt i64 %indvars.iv137.us, 1
  br i1 %cmp209.us, label %for.inc231.us.for.inc231.us_crit_edge, label %for.inc234.us

for.inc231.us.for.inc231.us_crit_edge:            ; preds = %for.inc231.us
  %indvars.iv.next134.us = add nsw i64 %indvars.iv137.us, -1
  br label %for.inc231.us

for.inc199.us:                                    ; preds = %for.inc199.us, %for.body127.us
  %indvars.iv133.us = phi i64 [ 1, %for.body127.us ], [ %indvars.iv.next126.us, %for.inc199.us ]
  %22 = add nsw i64 %indvars.iv133.us, -1
  %arrayidx150.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv142.us, i64 %22
  %23 = load double, double* %arrayidx150.us, align 8
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv142.us, i64 %indvars.iv133.us
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %17, i64 %indvars.iv133.us
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv142.us, i64 %indvars.iv133.us
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %18, i64 %indvars.iv133.us
  %arrayidx184.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv142.us, i64 %22
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %mul151.v.i1.2.us = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %mul151.us = fmul <2 x double> %mul151.v.i1.2.us, <double 0xC08F400000000001, double 0xC08F400000000001>
  %add152.us = fadd <2 x double> %mul151.us, <double 0x409F440000000001, double 0x409F440000000001>
  %add152.v.r1.us = extractelement <2 x double> %add152.us, i32 0
  %add152.v.r2.us = extractelement <2 x double> %add152.us, i32 1
  %div153.us = fdiv double 0x408F400000000001, %add152.v.r1.us
  store double %div153.us, double* %arrayidx157.us, align 8
  %25 = load double, double* %arrayidx163.us, align 8
  %26 = fmul double %25, 0xC09F400000000001
  %27 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %27, 0xC0AF3E0000000001
  %add172.us = fsub double %mul171.us, %26
  %28 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %28, 0xC09F400000000001
  %sub179.us = fsub double %add172.us, %mul178.us
  %29 = load double, double* %arrayidx184.us, align 8
  %mul185.us = fmul double %29, 0xC08F400000000001
  %sub186.us = fsub double %sub179.us, %mul185.us
  %div194.us = fdiv double %sub186.us, %add152.v.r2.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv142.us, i64 %indvars.iv133.us
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next126.us = add nuw nsw i64 %indvars.iv133.us, 1
  %exitcond131.us = icmp eq i64 %indvars.iv.next126.us, 999
  br i1 %exitcond131.us, label %for.cond140.for.end201_crit_edge.us, label %for.inc199.us

for.cond140.for.end201_crit_edge.us:              ; preds = %for.inc199.us
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv142.us, i64 999
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br label %for.inc231.us

for.inc237:                                       ; preds = %for.inc234.us
  %cmp = icmp slt i32 %storemerge145, 500
  br i1 %cmp, label %for.inc237.for.cond15.preheader_crit_edge, label %for.end239

for.inc237.for.cond15.preheader_crit_edge:        ; preds = %for.inc237
  %inc238 = add nuw nsw i32 %storemerge145, 1
  br label %for.cond15.preheader

for.end239:                                       ; preds = %for.inc237
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly %u) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv14.us = phi i64 [ 0, %entry ], [ %indvars.iv.next11.us, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv14.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv10.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv10.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv14.us, i64 %indvars.iv10.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv10.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1000
  br i1 %exitcond.us, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next11.us, 1000
  br i1 %exitcond16, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
