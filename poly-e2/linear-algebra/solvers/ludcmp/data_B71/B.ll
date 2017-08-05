; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry.for.body_crit_edge:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry.for.body_crit_edge
  %indvars.iv47 = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next48.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv47
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv47
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next48 = or i64 %indvars.iv47, 1
  %2 = trunc i64 %indvars.iv.next48 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv47
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %3 = trunc i64 %indvars.iv.next48.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond49.1 = icmp eq i64 %indvars.iv.next48, 1999
  br i1 %exitcond49.1, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.end39.for.body12_crit_edge
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.end39.for.body12_crit_edge ], [ 0, %for.body16.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv45, 32
  %sext = add i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %7 = sub i64 1998, %indvars.iv45
  %8 = shl i64 %7, 3
  br label %for.body16

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.lr.ph
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.body16.for.body16_crit_edge ], [ 0, %for.body16.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv31
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv31
  store double %add20, double* %arrayidx24, align 8
  %exitcond36 = icmp eq i64 %indvars.iv31, %indvars.iv45
  br i1 %exitcond36, label %for.end27, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  br label %for.body16

for.end27:                                        ; preds = %for.body16
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %cmp3012 = icmp slt i64 %indvars.iv.next46, 2000
  br i1 %cmp3012, label %for.end39.for.body12_crit_edge, label %for.end46.for.body50_crit_edge

for.end39.for.body12_crit_edge:                   ; preds = %for.end27
  %11 = and i64 %8, 34359738360
  %scevgep43 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %6
  %12 = add nuw nsw i64 %11, 8
  %scevgep4344 = bitcast double* %scevgep43 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep4344, i8 0, i64 %12, i32 8, i1 false)
  %arrayidx4352 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %arrayidx4352, align 8
  br label %for.body16.lr.ph

for.end46.for.body50_crit_edge:                   ; preds = %for.end27
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %arrayidx43, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end61

for.end61:                                        ; preds = %for.end61, %for.end46.for.body50_crit_edge
  %indvars.iv29 = phi i64 [ 0, %for.end46.for.body50_crit_edge ], [ %indvars.iv.next30.7, %for.end61 ]
  %13 = mul nuw nsw i64 %indvars.iv29, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %14 = mul nuw nsw i64 %indvars.iv.next30, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next30.1 = or i64 %indvars.iv29, 2
  %15 = mul nuw nsw i64 %indvars.iv.next30.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next30.2 = or i64 %indvars.iv29, 3
  %16 = mul nuw nsw i64 %indvars.iv.next30.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next30.3 = or i64 %indvars.iv29, 4
  %17 = mul nuw nsw i64 %indvars.iv.next30.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next30.4 = or i64 %indvars.iv29, 5
  %18 = mul nuw nsw i64 %indvars.iv.next30.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next30.5 = or i64 %indvars.iv29, 6
  %19 = mul nuw nsw i64 %indvars.iv.next30.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next30.6 = or i64 %indvars.iv29, 7
  %20 = mul nuw nsw i64 %indvars.iv.next30.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next30.7 = add nsw i64 %indvars.iv29, 8
  %exitcond57.7 = icmp eq i64 %indvars.iv.next30.7, 2000
  br i1 %exitcond57.7, label %for.cond69.preheader.preheader, label %for.end61

for.cond69.preheader.preheader:                   ; preds = %for.end61
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.end95, %for.cond69.preheader.preheader
  %indvars.iv24 = phi i64 [ 0, %for.cond69.preheader.preheader ], [ %indvars.iv.next25, %for.end95 ]
  br label %for.body72

for.body72:                                       ; preds = %for.end92, %for.cond69.preheader
  %indvars.iv22 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next23, %for.end92 ]
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv24
  br label %for.body76

for.body76:                                       ; preds = %for.body76.for.body76_crit_edge, %for.body72
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.body76.for.body76_crit_edge ], [ 0, %for.body72 ]
  %22 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv24
  %23 = load double, double* %arrayidx84, align 8
  %mul = fmul double %22, %23
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv22, i64 %indvars.iv19
  %24 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %24, %mul
  store double %add89, double* %arrayidx88, align 8
  %exitcond21 = icmp eq i64 %indvars.iv19, 1999
  br i1 %exitcond21, label %for.end92, label %for.body76.for.body76_crit_edge

for.body76.for.body76_crit_edge:                  ; preds = %for.body76
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br label %for.body76

for.end92:                                        ; preds = %for.body76
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond55, label %for.end95, label %for.body72

for.end95:                                        ; preds = %for.end92
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond56, label %for.body102.preheader, label %for.cond69.preheader

for.body102.preheader:                            ; preds = %for.end95
  %25 = bitcast i8* %call to [2000 x [2000 x double]]*
  %26 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body102

for.body102:                                      ; preds = %for.end117.1, %for.body102.preheader
  %indvars.iv17 = phi i64 [ 0, %for.body102.preheader ], [ %indvars.iv.next18.1, %for.end117.1 ]
  br label %for.body106

for.body106:                                      ; preds = %for.body106.for.body106_crit_edge, %for.body102
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body106.for.body106_crit_edge ], [ 0, %for.body102 ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv17, i64 %indvars.iv
  %27 = bitcast double* %arrayidx110 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv
  %29 = bitcast double* %arrayidx114 to i64*
  store i64 %28, i64* %29, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %for.end117, label %for.body106.for.body106_crit_edge

for.body106.for.body106_crit_edge:                ; preds = %for.body106
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body106

for.end117:                                       ; preds = %for.body106
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  br label %for.body106.1

for.end120:                                       ; preds = %for.end117.1
  call void @free(i8* nonnull %call) #4
  ret void

for.body106.1:                                    ; preds = %for.body106.for.body106_crit_edge.1, %for.end117
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %for.body106.for.body106_crit_edge.1 ], [ 0, %for.end117 ]
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv.next18, i64 %indvars.iv.1
  %30 = bitcast double* %arrayidx110.1 to i64*
  %31 = load i64, i64* %30, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next18, i64 %indvars.iv.1
  %32 = bitcast double* %arrayidx114.1 to i64*
  store i64 %31, i64* %32, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond.1, label %for.end117.1, label %for.body106.for.body106_crit_edge.1

for.body106.for.body106_crit_edge.1:              ; preds = %for.body106.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.body106.1

for.end117.1:                                     ; preds = %for.body106.1
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next18.1, 2000
  br i1 %exitcond54.1, label %for.end120, label %for.body102
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry.for.body_crit_edge:
  br label %for.body

for.body:                                         ; preds = %for.end57.for.body_crit_edge, %entry.for.body_crit_edge
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.end57.for.body_crit_edge ], [ 4294967295, %entry.for.body_crit_edge ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.end57.for.body_crit_edge ], [ 0, %entry.for.body_crit_edge ]
  %0 = and i64 %indvars.iv61, 4294967295
  %cmp217 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp217, label %for.body3.preheader, label %for.end57

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.end.for.body3_crit_edge
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.end.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.end.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %1 = and i64 %indvars.iv58, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv39
  %2 = load double, double* %arrayidx5, align 8
  %cmp715 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp715, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8.for.body8_crit_edge
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.body8.for.body8_crit_edge ], [ 0, %for.body8.preheader ]
  %3 = phi double [ %sub, %for.body8.for.body8_crit_edge ], [ %2, %for.body8.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv33
  %4 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv39
  %5 = load double, double* %arrayidx16, align 8
  %mul = fmul double %4, %5
  %sub = fsub double %3, %mul
  %exitcond60 = icmp eq i64 %indvars.iv33, %1
  br i1 %exitcond60, label %for.end.loopexit, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3
  %.lcssa7 = phi double [ %2, %for.body3 ], [ %sub, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv39
  %6 = load double, double* %arrayidx20, align 8
  %div = fdiv double %.lcssa7, %6
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next40 = add nuw i64 %indvars.iv39, 1
  %cmp2 = icmp slt i64 %indvars.iv.next40, %indvars.iv52
  br i1 %cmp2, label %for.end.for.body3_crit_edge, label %for.body30.us.preheader

for.end.for.body3_crit_edge:                      ; preds = %for.end
  %indvars.iv.next59 = add nuw nsw i64 %1, 1
  br label %for.body3

for.body30.us.preheader:                          ; preds = %for.end
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.end50.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.end50.us ], [ %indvars.iv52, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv50
  %7 = load double, double* %arrayidx34.us, align 8
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.for.body37.us_crit_edge, %for.body30.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.body37.us.for.body37.us_crit_edge ], [ 0, %for.body30.us ]
  %8 = phi double [ %sub47.us, %for.body37.us.for.body37.us_crit_edge ], [ %7, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv42
  %9 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv50
  %10 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %9, %10
  %sub47.us = fsub double %8, %mul46.us
  %exitcond63 = icmp eq i64 %indvars.iv42, %0
  br i1 %exitcond63, label %for.end50.us, label %for.body37.us.for.body37.us_crit_edge

for.body37.us.for.body37.us_crit_edge:            ; preds = %for.body37.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %for.body37.us

for.end50.us:                                     ; preds = %for.body37.us
  store double %sub47.us, double* %arrayidx34.us, align 8
  %indvars.iv.next51 = add nuw i64 %indvars.iv50, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond64, label %for.end57.loopexit, label %for.body30.us

for.end57.loopexit:                               ; preds = %for.end50.us
  br label %for.end57

for.end57:                                        ; preds = %for.end57.loopexit, %for.body
  %indvars.iv.next53 = add nuw i64 %indvars.iv52, 1
  %cmp = icmp slt i64 %indvars.iv.next53, 2000
  br i1 %cmp, label %for.end57.for.body_crit_edge, label %for.body63.preheader

for.body63.preheader:                             ; preds = %for.end57
  br label %for.body63

for.end57.for.body_crit_edge:                     ; preds = %for.end57
  %indvars.iv.next62 = add nuw nsw i64 %0, 1
  br label %for.body

for.body63:                                       ; preds = %for.body63.preheader, %for.end79.for.body63_crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.end79.for.body63_crit_edge ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.end79.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %11 = and i64 %indvars.iv55, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv31
  %12 = load double, double* %arrayidx65, align 8
  %cmp6712 = icmp sgt i64 %indvars.iv31, 0
  br i1 %cmp6712, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  br label %for.body68

for.body68:                                       ; preds = %for.body68.preheader, %for.body68.for.body68_crit_edge
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.body68.for.body68_crit_edge ], [ 0, %for.body68.preheader ]
  %13 = phi double [ %sub76, %for.body68.for.body68_crit_edge ], [ %12, %for.body68.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv26
  %14 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv26
  %15 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %14, %15
  %sub76 = fsub double %13, %mul75
  %exitcond57 = icmp eq i64 %indvars.iv26, %11
  br i1 %exitcond57, label %for.end79.loopexit, label %for.body68.for.body68_crit_edge

for.body68.for.body68_crit_edge:                  ; preds = %for.body68
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  br label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body63
  %.lcssa6 = phi double [ %12, %for.body63 ], [ %sub76, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv31
  store double %.lcssa6, double* %arrayidx81, align 8
  %indvars.iv.next32 = add nuw i64 %indvars.iv31, 1
  %cmp62 = icmp slt i64 %indvars.iv.next32, 2000
  br i1 %cmp62, label %for.end79.for.body63_crit_edge, label %for.body88.preheader

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  %indvars.iv.next56 = add nuw nsw i64 %11, 1
  br label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.end104.for.body88_crit_edge
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.end104.for.body88_crit_edge ], [ 1999, %for.body88.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end104.for.body88_crit_edge ], [ 2000, %for.body88.preheader ]
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv24
  %16 = load double, double* %arrayidx90, align 8
  %cmp929 = icmp slt i32 %indvars.iv, 2000
  br i1 %cmp929, label %for.body88.for.body93_crit_edge, label %for.end104

for.body88.for.body93_crit_edge:                  ; preds = %for.body88
  %17 = sext i32 %indvars.iv to i64
  br label %for.body93

for.body93:                                       ; preds = %for.body93.for.body93_crit_edge, %for.body88.for.body93_crit_edge
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.body93.for.body93_crit_edge ], [ %17, %for.body88.for.body93_crit_edge ]
  %18 = phi double [ %sub101, %for.body93.for.body93_crit_edge ], [ %16, %for.body88.for.body93_crit_edge ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv22
  %19 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv22
  %20 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %19, %20
  %sub101 = fsub double %18, %mul100
  %exitcond = icmp eq i64 %indvars.iv22, 1999
  br i1 %exitcond, label %for.end104.loopexit, label %for.body93.for.body93_crit_edge

for.body93.for.body93_crit_edge:                  ; preds = %for.body93
  %indvars.iv.next23 = add nsw i64 %indvars.iv22, 1
  br label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body88
  %.lcssa = phi double [ %16, %for.body88 ], [ %sub101, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv24
  %21 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %.lcssa, %21
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv24
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv24, 0
  br i1 %cmp87, label %for.end104.for.body88_crit_edge, label %for.end113

for.end104.for.body88_crit_edge:                  ; preds = %for.end104
  %indvars.iv.next25 = add i64 %indvars.iv24, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %for.body88

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry.for.body_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry.for.body_crit_edge
  %indvars.iv = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

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
