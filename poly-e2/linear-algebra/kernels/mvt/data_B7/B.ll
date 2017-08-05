; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  %arraydecay7 = bitcast i8* %call4 to double*
  %arraydecay8 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(i32 2000, double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
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
  %2 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(i32 2000, double* %2, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %x1, double* nocapture %x2, double* nocapture %y_1, double* nocapture %y_2, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %0 = sext i32 %n to i64
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.body.preheader, label %for.end36

for.body.preheader:                               ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %2 = insertelement <2 x double> undef, double %conv1, i32 0
  %div12.v.i1.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %wide.trip.count = zext i32 %n to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %3 = icmp eq i32 %n, 1
  %div29.prol = fdiv double 0.000000e+00, %conv1
  br label %for.body

for.cond.loopexit.loopexit:                       ; preds = %for.body25
  br label %for.cond.loopexit

for.cond.loopexit:                                ; preds = %for.cond.loopexit.loopexit, %for.body25.prol.loopexit
  %exitcond11 = icmp eq i64 %indvars.iv.next3, %0
  br i1 %exitcond11, label %for.end36.loopexit, label %for.body

for.body:                                         ; preds = %for.cond.loopexit, %for.body.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv.next3, %for.cond.loopexit ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv29 to i32
  %rem = srem i32 %4, %n
  %conv = sitofp i32 %rem to double
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv29
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv29, 1
  %5 = trunc i64 %indvars.iv.next3 to i32
  %rem2 = srem i32 %5, %n
  %conv3 = sitofp i32 %rem2 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv3, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %x2, i64 %indvars.iv29
  store double %div.v.r2, double* %arrayidx7, align 8
  %6 = add nuw nsw i64 %indvars.iv29, 3
  %7 = trunc i64 %6 to i32
  %rem9 = srem i32 %7, %n
  %conv10 = sitofp i32 %rem9 to double
  %arrayidx14 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv29
  %8 = add nuw nsw i64 %indvars.iv29, 4
  %9 = trunc i64 %8 to i32
  %rem16 = srem i32 %9, %n
  %conv17 = sitofp i32 %rem16 to double
  %div12.v.i0.1 = insertelement <2 x double> undef, double %conv10, i32 0
  %div12.v.i0.2 = insertelement <2 x double> %div12.v.i0.1, double %conv17, i32 1
  %div12 = fdiv <2 x double> %div12.v.i0.2, %div12.v.i1.2
  %div12.v.r1 = extractelement <2 x double> %div12, i32 0
  %div12.v.r2 = extractelement <2 x double> %div12, i32 1
  store double %div12.v.r1, double* %arrayidx14, align 8
  %arrayidx21 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv29
  store double %div12.v.r2, double* %arrayidx21, align 8
  br i1 %lcmp.mod, label %for.body25.prol.loopexit, label %for.body25.prol

for.body25.prol:                                  ; preds = %for.body
  %arrayidx33.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv29, i64 0
  store double %div29.prol, double* %arrayidx33.prol, align 8
  br label %for.body25.prol.loopexit

for.body25.prol.loopexit:                         ; preds = %for.body25.prol, %for.body
  %indvars.iv7.unr.ph = phi i64 [ 1, %for.body25.prol ], [ 0, %for.body ]
  br i1 %3, label %for.cond.loopexit, label %for.body25.preheader

for.body25.preheader:                             ; preds = %for.body25.prol.loopexit
  br label %for.body25

for.body25:                                       ; preds = %for.body25.preheader, %for.body25
  %indvars.iv7 = phi i64 [ %indvars.iv.next.1, %for.body25 ], [ %indvars.iv7.unr.ph, %for.body25.preheader ]
  %10 = mul nuw nsw i64 %indvars.iv7, %indvars.iv29
  %11 = trunc i64 %10 to i32
  %rem26 = srem i32 %11, %n
  %conv27 = sitofp i32 %rem26 to double
  %div29 = fdiv double %conv27, %conv1
  %arrayidx33 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv7
  store double %div29, double* %arrayidx33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv29
  %13 = trunc i64 %12 to i32
  %rem26.1 = srem i32 %13, %n
  %conv27.1 = sitofp i32 %rem26.1 to double
  %div29.1 = fdiv double %conv27.1, %conv1
  %arrayidx33.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv.next
  store double %div29.1, double* %arrayidx33.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv7, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond.loopexit.loopexit, label %for.body25

for.end36.loopexit:                               ; preds = %for.cond.loopexit
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32 %n, double* nocapture %x1, double* nocapture %x2, double* nocapture readonly %y_1, double* nocapture readonly %y_2, [2000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %0 = sext i32 %n to i64
  %cmp17 = icmp sgt i32 %n, 0
  br i1 %cmp17, label %for.cond1.preheader.preheader, label %for.end38

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count5 = zext i32 %n to i64
  %xtraiter24 = and i64 %wide.trip.count5, 1
  %lcmp.mod25 = icmp eq i64 %xtraiter24, 0
  %1 = icmp eq i32 %n, 1
  %sunkaddr30 = ptrtoint double* %x1 to i64
  %sunkaddr = ptrtoint double* %x1 to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %for.cond1.preheader.preheader
  %indvars.iv718 = phi i64 [ %indvars.iv.next8, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  br i1 %lcmp.mod25, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.cond1.preheader
  %sunkaddr27 = shl i64 %indvars.iv718, 3
  %sunkaddr28 = add i64 %sunkaddr, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  %2 = load double, double* %sunkaddr29, align 8
  %arrayidx7.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv718, i64 0
  %3 = load double, double* %arrayidx7.prol, align 8
  %4 = load double, double* %y_1, align 8
  %mul.prol = fmul double %3, %4
  %add.prol = fadd double %2, %mul.prol
  store double %add.prol, double* %sunkaddr29, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.cond1.preheader
  %indvars.iv315.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.cond1.preheader ]
  br i1 %1, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %sunkaddr31 = shl i64 %indvars.iv718, 3
  %sunkaddr32 = add i64 %sunkaddr30, %sunkaddr31
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  br label %for.body3

for.cond15.preheader:                             ; preds = %for.end
  %cmp1611 = icmp sgt i32 %n, 0
  br i1 %cmp1611, label %for.cond18.preheader.preheader, label %for.end38

for.cond18.preheader.preheader:                   ; preds = %for.cond15.preheader
  %wide.trip.count = zext i32 %n to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %5 = icmp eq i32 %n, 1
  %sunkaddr38 = ptrtoint double* %x2 to i64
  %sunkaddr34 = ptrtoint double* %x2 to i64
  br label %for.cond18.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv315 = phi i64 [ %indvars.iv.next4.1, %for.body3 ], [ %indvars.iv315.unr.ph, %for.body3.preheader ]
  %6 = load double, double* %sunkaddr33, align 8
  %arrayidx7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv718, i64 %indvars.iv315
  %7 = load double, double* %arrayidx7, align 8
  %arrayidx9 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv315
  %8 = load double, double* %arrayidx9, align 8
  %mul = fmul double %7, %8
  %add = fadd double %6, %mul
  store double %add, double* %sunkaddr33, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv315, 1
  %arrayidx7.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv718, i64 %indvars.iv.next4
  %9 = load double, double* %arrayidx7.1, align 8
  %arrayidx9.1 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv.next4
  %10 = load double, double* %arrayidx9.1, align 8
  %mul.1 = fmul double %9, %10
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %sunkaddr33, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv315, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next4.1, %wide.trip.count5
  br i1 %exitcond6.1, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv718, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next8, %0
  br i1 %exitcond23, label %for.cond15.preheader, label %for.cond1.preheader

for.cond18.preheader:                             ; preds = %for.end35, %for.cond18.preheader.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next2, %for.end35 ], [ 0, %for.cond18.preheader.preheader ]
  br i1 %lcmp.mod, label %for.body20.prol.loopexit, label %for.body20.prol

for.body20.prol:                                  ; preds = %for.cond18.preheader
  %sunkaddr35 = shl i64 %indvars.iv112, 3
  %sunkaddr36 = add i64 %sunkaddr34, %sunkaddr35
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %11 = load double, double* %sunkaddr37, align 8
  %arrayidx26.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv112
  %12 = load double, double* %arrayidx26.prol, align 8
  %13 = load double, double* %y_2, align 8
  %mul29.prol = fmul double %12, %13
  %add30.prol = fadd double %11, %mul29.prol
  store double %add30.prol, double* %sunkaddr37, align 8
  br label %for.body20.prol.loopexit

for.body20.prol.loopexit:                         ; preds = %for.body20.prol, %for.cond18.preheader
  %indvars.iv10.unr.ph = phi i64 [ 1, %for.body20.prol ], [ 0, %for.cond18.preheader ]
  br i1 %5, label %for.end35, label %for.body20.preheader

for.body20.preheader:                             ; preds = %for.body20.prol.loopexit
  %sunkaddr39 = shl i64 %indvars.iv112, 3
  %sunkaddr40 = add i64 %sunkaddr38, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  br label %for.body20

for.body20:                                       ; preds = %for.body20.preheader, %for.body20
  %indvars.iv10 = phi i64 [ %indvars.iv.next.1, %for.body20 ], [ %indvars.iv10.unr.ph, %for.body20.preheader ]
  %14 = load double, double* %sunkaddr41, align 8
  %arrayidx26 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv112
  %15 = load double, double* %arrayidx26, align 8
  %arrayidx28 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv10
  %16 = load double, double* %arrayidx28, align 8
  %mul29 = fmul double %15, %16
  %add30 = fadd double %14, %mul29
  store double %add30, double* %sunkaddr41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %arrayidx26.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv112
  %17 = load double, double* %arrayidx26.1, align 8
  %arrayidx28.1 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx28.1, align 8
  %mul29.1 = fmul double %17, %18
  %add30.1 = fadd double %add30, %mul29.1
  store double %add30.1, double* %sunkaddr41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.end35.loopexit, label %for.body20

for.end35.loopexit:                               ; preds = %for.body20
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %for.body20.prol.loopexit
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next2, %0
  br i1 %exitcond22, label %for.end38.loopexit, label %for.cond18.preheader

for.end38.loopexit:                               ; preds = %for.end35
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %entry, %for.cond15.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x1, double* nocapture readonly %x2) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %n to i64
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv410 = phi i64 [ %indvars.iv.next5, %if.end ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv410 to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv410
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next5, %3
  br i1 %exitcond11, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp86 = icmp sgt i32 %n, 0
  br i1 %cmp86, label %for.body9.preheader, label %for.end20

for.body9.preheader:                              ; preds = %for.end
  br label %for.body9

for.body9:                                        ; preds = %for.body9.preheader, %if.end14
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %if.end14 ], [ 0, %for.body9.preheader ]
  %10 = trunc i64 %indvars.iv7 to i32
  %rem10 = srem i32 %10, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %for.body9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %if.end14

if.end14:                                         ; preds = %for.body9, %if.then12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %x2, i64 %indvars.iv7
  %13 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.end20.loopexit, label %for.body9

for.end20.loopexit:                               ; preds = %if.end14
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %15) #5
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
