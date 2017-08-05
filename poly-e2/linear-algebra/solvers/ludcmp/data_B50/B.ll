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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [2000 x double]*
  %arraydecay42 = bitcast i8* %call1 to double*
  %arraydecay53 = bitcast i8* %call2 to double*
  %arraydecay64 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay1, double* %arraydecay42, double* %arraydecay53, double* %arraydecay64)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay1, double* %arraydecay42, double* %arraydecay53, double* %arraydecay64)
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
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv109 = phi i64 [ 0, %entry ], [ %indvars.iv.next110.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv109
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv109
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv109 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv109
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next110.1 = add nuw nsw i64 %indvars.iv109, 2
  %4 = trunc i64 %indvars.iv.next110.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond131.1 = icmp eq i64 %indvars.iv.next110.1, 2000
  br i1 %exitcond131.1, label %for.body12.preheader, label %for.body

for.body12.preheader:                             ; preds = %for.body
  br label %for.body12

for.body12:                                       ; preds = %for.body12.preheader, %for.end39
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.end39 ], [ 0, %for.body12.preheader ]
  %6 = phi [2000 x double]* [ %11, %for.end39 ], [ %A, %for.body12.preheader ]
  br label %for.body16

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body12
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %for.body16.for.body16_crit_edge ], [ 0, %for.body12 ]
  %7 = sub nsw i64 0, %indvars.iv94
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv1, i64 %indvars.iv94
  store double %add20, double* %arrayidx24, align 8
  %exitcond129 = icmp eq i64 %indvars.iv94, %indvars.iv1
  br i1 %exitcond129, label %for.body16.for.end27_crit_edge, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  br label %for.body16

for.body16.for.end27_crit_edge:                   ; preds = %for.body16
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %cmp309 = icmp slt i64 %indvars.iv.next2, 2000
  br i1 %cmp309, label %for.body32.lr.ph, label %for.end39

for.body32.lr.ph:                                 ; preds = %for.body16.for.end27_crit_edge
  %9 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body32

for.body32:                                       ; preds = %for.body32.for.body32_crit_edge, %for.body32.lr.ph
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.body32.for.body32_crit_edge ], [ %indvars.iv.next2, %for.body32.lr.ph ]
  %10 = phi [2000 x double]* [ %9, %for.body32.for.body32_crit_edge ], [ %.pre, %for.body32.lr.ph ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv1, i64 %indvars.iv103
  store double 0.000000e+00, double* %arrayidx36, align 8
  %exitcond130 = icmp eq i64 %indvars.iv103, 1999
  br i1 %exitcond130, label %for.end39.loopexit, label %for.body32.for.body32_crit_edge

for.body32.for.body32_crit_edge:                  ; preds = %for.body32
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  br label %for.body32

for.end39.loopexit:                               ; preds = %for.body32
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.body16.for.end27_crit_edge
  %11 = phi [2000 x double]* [ %.pre, %for.body16.for.end27_crit_edge ], [ %9, %for.end39.loopexit ]
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv1, i64 %indvars.iv1
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %for.end46, label %for.body12

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %12 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %12, align 8
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us.for.inc62.us_crit_edge, %for.end46
  %indvars.iv91 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next92, %for.inc62.us.for.inc62.us_crit_edge ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv91, i64 0
  %scevgep90 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep90, i8 0, i64 16000, i32 8, i1 false)
  %exitcond126 = icmp eq i64 %indvars.iv91, 1999
  br i1 %exitcond126, label %for.cond69.preheader.lr.ph, label %for.inc62.us.for.inc62.us_crit_edge

for.inc62.us.for.inc62.us_crit_edge:              ; preds = %for.inc62.us
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  br label %for.inc62.us

for.cond69.preheader.lr.ph:                       ; preds = %for.inc62.us
  %14 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us

for.cond69.preheader.us:                          ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph
  %indvars.iv83 = phi i64 [ 0, %for.cond69.preheader.lr.ph ], [ %indvars.iv.next84, %for.inc96.us ]
  br label %for.body72.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond124, label %for.body102.lr.ph, label %for.cond69.preheader.us

for.body72.us.us:                                 ; preds = %for.inc93.us.us, %for.cond69.preheader.us
  %indvars.iv81 = phi i64 [ 0, %for.cond69.preheader.us ], [ %indvars.iv.next82, %for.inc93.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv81, i64 %indvars.iv83
  br label %for.body76.us.us

for.inc93.us.us:                                  ; preds = %for.body76.us.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next82, 2000
  br i1 %exitcond123, label %for.inc96.us, label %for.body72.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.for.body76.us.us_crit_edge, %for.body72.us.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.body76.us.us.for.body76.us.us_crit_edge ], [ 0, %for.body72.us.us ]
  %16 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv77, i64 %indvars.iv83
  %17 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %16, %17
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv81, i64 %indvars.iv77
  %18 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %18, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %exitcond122 = icmp eq i64 %indvars.iv77, 1999
  br i1 %exitcond122, label %for.inc93.us.us, label %for.body76.us.us.for.body76.us.us_crit_edge

for.body76.us.us.for.body76.us.us_crit_edge:      ; preds = %for.body76.us.us
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  br label %for.body76.us.us

for.body102.lr.ph:                                ; preds = %for.inc96.us
  %19 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %20 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body102.us

for.body102.us:                                   ; preds = %for.inc118.us.1, %for.body102.lr.ph
  %indvars.iv75 = phi i64 [ 0, %for.body102.lr.ph ], [ %indvars.iv.next76.1, %for.inc118.us.1 ]
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us.for.body106.us_crit_edge, %for.body102.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body106.us.for.body106.us_crit_edge ], [ 0, %for.body102.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv75, i64 %indvars.iv
  %21 = bitcast double* %arrayidx110.us to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %20, i64 %indvars.iv75, i64 %indvars.iv
  %23 = bitcast double* %arrayidx114.us to i64*
  store i64 %22, i64* %23, align 8
  %exitcond121 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond121, label %for.inc118.us, label %for.body106.us.for.body106.us_crit_edge

for.body106.us.for.body106.us_crit_edge:          ; preds = %for.body106.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body106.us

for.inc118.us:                                    ; preds = %for.body106.us
  %indvars.iv.next76 = or i64 %indvars.iv75, 1
  br label %for.body106.us.1

for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge: ; preds = %for.inc118.us.1
  %24 = bitcast [2000 x [2000 x double]]* %19 to i8*
  tail call void @free(i8* %24) #4
  ret void

for.body106.us.1:                                 ; preds = %for.body106.us.for.body106.us_crit_edge.1, %for.inc118.us
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %for.body106.us.for.body106.us_crit_edge.1 ], [ 0, %for.inc118.us ]
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv.next76, i64 %indvars.iv.1
  %25 = bitcast double* %arrayidx110.us.1 to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %20, i64 %indvars.iv.next76, i64 %indvars.iv.1
  %27 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %26, i64* %27, align 8
  %exitcond121.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond121.1, label %for.inc118.us.1, label %for.body106.us.for.body106.us_crit_edge.1

for.body106.us.for.body106.us_crit_edge.1:        ; preds = %for.body106.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.body106.us.1

for.inc118.us.1:                                  ; preds = %for.body106.us.1
  %indvars.iv.next76.1 = add nuw nsw i64 %indvars.iv75, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next76.1, 2000
  br i1 %exitcond.1, label %for.inc118.us.for.cond99.for.end120_crit_edge_crit_edge, label %for.body102.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc58, %entry
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.inc58 ]
  %indvars.iv89 = phi i32 [ -1, %entry ], [ %indvars.iv.next90, %for.inc58 ]
  %0 = zext i32 %indvars.iv89 to i64
  %indvars.iv.next90 = add nsw i32 %indvars.iv89, 1
  %cmp26 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp26, label %for.body3.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body
  br label %for.body30

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv85 = phi i32 [ %indvars.iv.next86, %for.end ], [ -1, %for.body3.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.end ], [ 0, %for.body3.preheader ]
  %1 = zext i32 %indvars.iv85 to i64
  %indvars.iv.next86 = add nsw i32 %indvars.iv85, 1
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv58
  %2 = load double, double* %arrayidx5, align 8
  %cmp75 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp75, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8.for.body8_crit_edge
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.body8.for.body8_crit_edge ], [ 0, %for.body8.preheader ]
  %sub23 = phi double [ %sub, %for.body8.for.body8_crit_edge ], [ %2, %for.body8.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv52
  %3 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv58
  %4 = load double, double* %arrayidx16, align 8
  %mul = fmul double %3, %4
  %sub = fsub double %sub23, %mul
  %exitcond87 = icmp eq i64 %indvars.iv52, %1
  br i1 %exitcond87, label %for.end.loopexit, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  br label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3
  %5 = phi double [ %2, %for.body3 ], [ %sub, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv58
  %6 = load double, double* %arrayidx20, align 8
  %div = fdiv double %5, %6
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next59, %indvars.iv2
  br i1 %exitcond4, label %for.body30.us.preheader, label %for.body3

for.body30.us.preheader:                          ; preds = %for.end
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv75
  %7 = load double, double* %arrayidx34.us, align 8
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.for.body37.us_crit_edge, %for.body30.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.body37.us.for.body37.us_crit_edge ], [ 0, %for.body30.us ]
  %sub4728.us = phi double [ %sub47.us, %for.body37.us.for.body37.us_crit_edge ], [ %7, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv67
  %8 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv75
  %9 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %8, %9
  %sub47.us = fsub double %sub4728.us, %mul46.us
  %exitcond91 = icmp eq i64 %indvars.iv67, %0
  br i1 %exitcond91, label %for.cond35.for.end50_crit_edge.us, label %for.body37.us.for.body37.us_crit_edge

for.body37.us.for.body37.us_crit_edge:            ; preds = %for.body37.us
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  br label %for.body37.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.body37.us
  store double %sub47.us, double* %arrayidx34.us, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond92, label %for.inc58.loopexit, label %for.body30.us

for.body30:                                       ; preds = %for.body30.preheader, %for.body30.for.body30_crit_edge
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.body30.for.body30_crit_edge ], [ %indvars.iv2, %for.body30.preheader ]
  %exitcond88 = icmp eq i64 %indvars.iv62, 1999
  br i1 %exitcond88, label %for.inc58.loopexit8, label %for.body30.for.body30_crit_edge

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br label %for.body30

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58.loopexit8:                              ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit8, %for.inc58.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond5, label %for.body63.preheader, label %for.body

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.end79.for.body63_crit_edge
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %for.end79.for.body63_crit_edge ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.end79.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %10 = and i64 %indvars.iv82, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv50
  %11 = bitcast double* %arrayidx65 to i64*
  %12 = load i64, i64* %11, align 8
  %cmp673 = icmp sgt i64 %indvars.iv50, 0
  br i1 %cmp673, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  %13 = bitcast i64 %12 to double
  br label %for.body68

for.body68:                                       ; preds = %for.body68.for.body68_crit_edge, %for.body68.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.body68.for.body68_crit_edge ], [ 0, %for.body68.preheader ]
  %sub7617 = phi double [ %sub76, %for.body68.for.body68_crit_edge ], [ %13, %for.body68.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv44
  %14 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv44
  %15 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %14, %15
  %sub76 = fsub double %sub7617, %mul75
  %exitcond84 = icmp eq i64 %indvars.iv44, %10
  br i1 %exitcond84, label %for.cond66.for.end79_crit_edge, label %for.body68.for.body68_crit_edge

for.body68.for.body68_crit_edge:                  ; preds = %for.body68
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br label %for.body68

for.cond66.for.end79_crit_edge:                   ; preds = %for.body68
  %16 = bitcast double %sub76 to i64
  br label %for.end79

for.end79:                                        ; preds = %for.body63, %for.cond66.for.end79_crit_edge
  %17 = phi i64 [ %16, %for.cond66.for.end79_crit_edge ], [ %12, %for.body63 ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv50
  %18 = bitcast double* %arrayidx81 to i64*
  store i64 %17, i64* %18, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.end79.for.body63_crit_edge

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  %indvars.iv.next83 = add nuw nsw i64 %10, 1
  br label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.end104.for.body88_crit_edge
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.end104.for.body88_crit_edge ], [ 1999, %for.body88.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end104.for.body88_crit_edge ], [ 2000, %for.body88.preheader ]
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv41
  %19 = load double, double* %arrayidx90, align 8
  %20 = add nsw i64 %indvars.iv41, 1
  %cmp921 = icmp slt i64 %20, 2000
  br i1 %cmp921, label %for.body93.lr.ph, label %for.end104

for.body93.lr.ph:                                 ; preds = %for.body88
  %21 = sext i32 %indvars.iv to i64
  br label %for.body93

for.body93:                                       ; preds = %for.body93.for.body93_crit_edge, %for.body93.lr.ph
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.body93.for.body93_crit_edge ], [ %21, %for.body93.lr.ph ]
  %sub10111 = phi double [ %sub101, %for.body93.for.body93_crit_edge ], [ %19, %for.body93.lr.ph ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv39
  %22 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv39
  %23 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %22, %23
  %sub101 = fsub double %sub10111, %mul100
  %exitcond = icmp eq i64 %indvars.iv39, 1999
  br i1 %exitcond, label %for.end104.loopexit, label %for.body93.for.body93_crit_edge

for.body93.for.body93_crit_edge:                  ; preds = %for.body93
  %indvars.iv.next40 = add nsw i64 %indvars.iv39, 1
  br label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body88
  %24 = phi double [ %19, %for.body88 ], [ %sub101, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv41
  %25 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %24, %25
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv41
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv41, 0
  br i1 %cmp87, label %for.end104.for.body88_crit_edge, label %for.end113

for.end104.for.body88_crit_edge:                  ; preds = %for.end104
  %indvars.iv.next42 = add i64 %indvars.iv41, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %for.body88

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
