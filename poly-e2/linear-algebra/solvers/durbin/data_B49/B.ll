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
  %arraydecay1 = bitcast i8* %call to double*
  tail call fastcc void @init_array(double* %arraydecay1)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay33 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(double* %arraydecay1, double* %arraydecay33)
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
  %1 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %r) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next.4, %for.body ]
  %0 = sub nuw nsw i64 2001, %indvars.iv2
  %1 = trunc i64 %0 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv2
  %2 = bitcast double* %arrayidx to <2 x double>*
  %3 = sub i64 2000, %indvars.iv2
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %5 = insertelement <2 x double> undef, double %conv, i32 0
  %6 = insertelement <2 x double> %5, double %conv.1, i32 1
  store <2 x double> %6, <2 x double>* %2, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %7 = sub i64 1999, %indvars.iv2
  %8 = trunc i64 %7 to i32
  %conv.2 = sitofp i32 %8 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  %9 = bitcast double* %arrayidx.2 to <2 x double>*
  %10 = sub i64 1998, %indvars.iv2
  %11 = trunc i64 %10 to i32
  %conv.3 = sitofp i32 %11 to double
  %12 = insertelement <2 x double> undef, double %conv.2, i32 0
  %13 = insertelement <2 x double> %12, double %conv.3, i32 1
  store <2 x double> %13, <2 x double>* %9, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv2, 4
  %14 = sub i64 1997, %indvars.iv2
  %15 = trunc i64 %14 to i32
  %conv.4 = sitofp i32 %15 to double
  %arrayidx.4 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv2, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly %r, double* %y) unnamed_addr #2 {
entry:
  %z = alloca [2000 x double], align 16
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  br label %for.body

for.body:                                         ; preds = %for.end44, %entry
  %indvar = phi i64 [ 0, %entry ], [ %3, %for.end44 ]
  %beta.024 = phi double [ 1.000000e+00, %entry ], [ %mul5, %for.end44 ]
  %alpha.023 = phi double [ %sub3, %entry ], [ %div, %for.end44 ]
  %indvars.iv1522 = phi i64 [ 1, %entry ], [ %indvars.iv.next16, %for.end44 ]
  %2 = add i64 %indvar, -1
  %3 = add i64 %indvar, 1
  %4 = shl i64 %indvar, 3
  %5 = add nuw nsw i64 %4, 8
  %mul = fmul double %alpha.023, %alpha.023
  %sub4 = fsub double 1.000000e+00, %mul
  %sub9 = add nsw i64 %indvars.iv1522, -1
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body8.prol.loopexit, label %for.body8.prol.preheader

for.body8.prol.preheader:                         ; preds = %for.body
  br label %for.body8.prol

for.body8.prol:                                   ; preds = %for.body8.prol.preheader, %for.body8.prol
  %sum.019.prol = phi double [ %add.prol, %for.body8.prol ], [ 0.000000e+00, %for.body8.prol.preheader ]
  %indvars.iv18.prol = phi i64 [ %indvars.iv.next.prol, %for.body8.prol ], [ 0, %for.body8.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body8.prol ], [ %xtraiter, %for.body8.prol.preheader ]
  %sub10.prol = sub nsw i64 %sub9, %indvars.iv18.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %sub10.prol
  %6 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv18.prol
  %7 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %6, %7
  %add.prol = fadd double %sum.019.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv18.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body8.prol.loopexit.loopexit, label %for.body8.prol, !llvm.loop !1

for.body8.prol.loopexit.loopexit:                 ; preds = %for.body8.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol.loopexit.loopexit, %for.body
  %add.lcssa.unr = phi double [ undef, %for.body ], [ %add.prol, %for.body8.prol.loopexit.loopexit ]
  %sum.019.unr = phi double [ 0.000000e+00, %for.body ], [ %add.prol, %for.body8.prol.loopexit.loopexit ]
  %indvars.iv18.unr = phi i64 [ 0, %for.body ], [ %indvars.iv.next.prol, %for.body8.prol.loopexit.loopexit ]
  %8 = icmp ult i64 %indvar, 3
  br i1 %8, label %for.end, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8
  %sum.019 = phi double [ %add.3, %for.body8 ], [ %sum.019.unr, %for.body8.preheader ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next.3, %for.body8 ], [ %indvars.iv18.unr, %for.body8.preheader ]
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv18
  %9 = bitcast double* %arrayidx13 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %sub10.1 = sub nsw i64 %sub9, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %sub10.1
  %10 = bitcast double* %arrayidx11.1 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %12 = load <2 x double>, <2 x double>* %9, align 8
  %mul14.v.i0 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %mul14 = fmul <2 x double> %mul14.v.i0, %12
  %mul14.v.r1 = extractelement <2 x double> %mul14, i32 0
  %mul14.v.r2 = extractelement <2 x double> %mul14, i32 1
  %add = fadd double %sum.019, %mul14.v.r1
  %add.1 = fadd double %add, %mul14.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv18, 2
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %13 = bitcast double* %arrayidx13.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv18, 3
  %sub10.3 = sub nsw i64 %sub9, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %sub10.3
  %14 = bitcast double* %arrayidx11.3 to <2 x double>*
  %15 = load <2 x double>, <2 x double>* %14, align 8
  %16 = load <2 x double>, <2 x double>* %13, align 8
  %mul14.2.v.i0 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %mul14.2 = fmul <2 x double> %mul14.2.v.i0, %16
  %mul14.2.v.r1 = extractelement <2 x double> %mul14.2, i32 0
  %mul14.2.v.r2 = extractelement <2 x double> %mul14.2, i32 1
  %add.2 = fadd double %add.1, %mul14.2.v.r1
  %add.3 = fadd double %add.2, %mul14.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv18, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1522
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit
  %add.lcssa = phi double [ %add.lcssa.unr, %for.body8.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %mul5 = fmul double %beta.024, %sub4
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv1522
  %17 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %17
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %18 = and i64 %indvar, 1
  %lcmp.mod28 = icmp eq i64 %18, 0
  br i1 %lcmp.mod28, label %for.body21.prol, label %for.body21.prol.loopexit

for.body21.prol:                                  ; preds = %for.end
  %19 = ptrtoint double* %y to i64
  %20 = bitcast [2000 x double]* %z to double*
  %21 = load double, double* %y, align 8
  %sunkaddr29 = shl i64 %indvars.iv1522, 3
  %sunkaddr30 = add i64 %19, %sunkaddr29
  %sunkaddr31 = add i64 %sunkaddr30, -8
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to double*
  %22 = load double, double* %sunkaddr32, align 8
  %mul28.prol = fmul double %div, %22
  %add29.prol = fadd double %21, %mul28.prol
  store double %add29.prol, double* %20, align 16
  br label %for.body21.prol.loopexit

for.body21.prol.loopexit:                         ; preds = %for.end, %for.body21.prol
  %indvars.iv320.unr.ph = phi i64 [ 1, %for.body21.prol ], [ 0, %for.end ]
  %23 = icmp eq i64 %indvar, 0
  br i1 %23, label %for.end44, label %for.body21.preheader

for.body21.preheader:                             ; preds = %for.body21.prol.loopexit
  %24 = sub i64 %2, %indvars.iv320.unr.ph
  %25 = lshr i64 %24, 1
  %26 = and i64 %25, 1
  %lcmp.mod37 = icmp eq i64 %26, 0
  br i1 %lcmp.mod37, label %for.body21.prol38, label %for.body21.prol.loopexit35

for.body21.prol38:                                ; preds = %for.body21.preheader
  %arrayidx23.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv320.unr.ph
  %27 = bitcast double* %arrayidx23.prol to <2 x double>*
  %arrayidx31.prol = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv320.unr.ph
  %indvars.iv.next4.prol = add nuw nsw i64 %indvars.iv320.unr.ph, 1
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %sub25.1.prol = sub nsw i64 %sub9, %indvars.iv.next4.prol
  %arrayidx27.1.prol = getelementptr inbounds double, double* %y, i64 %sub25.1.prol
  %29 = bitcast double* %arrayidx27.1.prol to <2 x double>*
  %30 = load <2 x double>, <2 x double>* %29, align 8
  %31 = insertelement <2 x double> undef, double %div, i32 0
  %mul28.v.i0.2.prol = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %mul28.1.prol = fmul <2 x double> %mul28.v.i0.2.prol, %30
  %add29.v.i1.prol = shufflevector <2 x double> %mul28.1.prol, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %add29.prol39 = fadd <2 x double> %28, %add29.v.i1.prol
  %32 = bitcast double* %arrayidx31.prol to <2 x double>*
  store <2 x double> %add29.prol39, <2 x double>* %32, align 8
  %indvars.iv.next4.1.prol = or i64 %indvars.iv320.unr.ph, 2
  br label %for.body21.prol.loopexit35

for.body21.prol.loopexit35:                       ; preds = %for.body21.prol38, %for.body21.preheader
  %indvars.iv320.unr.ph40 = phi i64 [ %indvars.iv.next4.1.prol, %for.body21.prol38 ], [ %indvars.iv320.unr.ph, %for.body21.preheader ]
  %33 = icmp eq i64 %25, 0
  br i1 %33, label %for.end44, label %for.body21.preheader.new

for.body21.preheader.new:                         ; preds = %for.body21.prol.loopexit35
  %34 = insertelement <2 x double> undef, double %div, i32 0
  %mul28.v.i0.2 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = insertelement <2 x double> undef, double %div, i32 0
  %mul28.v.i0.2.1 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body21

for.body21:                                       ; preds = %for.body21, %for.body21.preheader.new
  %indvars.iv320 = phi i64 [ %indvars.iv320.unr.ph40, %for.body21.preheader.new ], [ %indvars.iv.next4.1.1, %for.body21 ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv320
  %36 = bitcast double* %arrayidx23 to <2 x double>*
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv320
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv320, 1
  %37 = load <2 x double>, <2 x double>* %36, align 8
  %sub25.1 = sub nsw i64 %sub9, %indvars.iv.next4
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %sub25.1
  %38 = bitcast double* %arrayidx27.1 to <2 x double>*
  %39 = load <2 x double>, <2 x double>* %38, align 8
  %mul28.1 = fmul <2 x double> %mul28.v.i0.2, %39
  %add29.v.i1 = shufflevector <2 x double> %mul28.1, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %add29 = fadd <2 x double> %37, %add29.v.i1
  %40 = bitcast double* %arrayidx31 to <2 x double>*
  store <2 x double> %add29, <2 x double>* %40, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv320, 2
  %arrayidx23.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next4.1
  %41 = bitcast double* %arrayidx23.1 to <2 x double>*
  %arrayidx31.1 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv.next4.1
  %indvars.iv.next4.141 = add nsw i64 %indvars.iv320, 3
  %42 = load <2 x double>, <2 x double>* %41, align 8
  %sub25.1.1 = sub nsw i64 %sub9, %indvars.iv.next4.141
  %arrayidx27.1.1 = getelementptr inbounds double, double* %y, i64 %sub25.1.1
  %43 = bitcast double* %arrayidx27.1.1 to <2 x double>*
  %44 = load <2 x double>, <2 x double>* %43, align 8
  %mul28.1.1 = fmul <2 x double> %mul28.v.i0.2.1, %44
  %add29.v.i1.1 = shufflevector <2 x double> %mul28.1.1, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %add29.1 = fadd <2 x double> %42, %add29.v.i1.1
  %45 = bitcast double* %arrayidx31.1 to <2 x double>*
  store <2 x double> %add29.1, <2 x double>* %45, align 8
  %indvars.iv.next4.1.1 = add nsw i64 %indvars.iv320, 4
  %exitcond8.1.1 = icmp eq i64 %indvars.iv.next4.1.1, %indvars.iv1522
  br i1 %exitcond8.1.1, label %for.end44.loopexit, label %for.body21

for.end44.loopexit:                               ; preds = %for.body21
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %for.body21.prol.loopexit35, %for.body21.prol.loopexit
  %46 = bitcast double* %y to i8*
  %47 = bitcast [2000 x double]* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* nonnull %47, i64 %5, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv1522
  store double %div, double* %arrayidx46, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1522, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond17, label %for.end49, label %for.body

for.end49:                                        ; preds = %for.end44
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv1 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv1 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv1
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
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
