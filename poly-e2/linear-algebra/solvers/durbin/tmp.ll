; ModuleID = 'B.ll'
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
  %arraydecay = bitcast i8* %call to double*
  tail call fastcc void @init_array(double* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(double* %arraydecay, double* %arraydecay3)
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
  tail call fastcc void @print_array(double* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
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
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.4, %for.body ]
  %0 = sub nuw nsw i64 2001, %indvars.iv
  %1 = trunc i64 %0 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = sub nuw nsw i64 2000, %indvars.iv
  %3 = trunc i64 %2 to i32
  %conv.1 = sitofp i32 %3 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %4 = sub nuw nsw i64 1999, %indvars.iv
  %5 = trunc i64 %4 to i32
  %conv.2 = sitofp i32 %5 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %6 = sub nuw nsw i64 1998, %indvars.iv
  %7 = trunc i64 %6 to i32
  %conv.3 = sitofp i32 %7 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %8 = sub nuw nsw i64 1997, %indvars.iv
  %9 = trunc i64 %8 to i32
  %conv.4 = sitofp i32 %9 to double
  %arrayidx.4 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.3
  store double %conv.4, double* %arrayidx.4, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly %r, double* nocapture %y) unnamed_addr #2 {
entry:
  %y58 = bitcast double* %y to i8*
  %z = alloca [2000 x double], align 16
  %z59 = bitcast [2000 x double]* %z to i8*
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  br label %for.body8.lr.ph

for.body8.lr.ph:                                  ; preds = %for.end44, %entry
  %indvars.iv9 = phi i2 [ %indvars.iv.next10, %for.end44 ], [ 1, %entry ]
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.end44 ], [ 1, %entry ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.end44 ], [ 0, %entry ]
  %beta.040 = phi double [ %mul5, %for.end44 ], [ 1.000000e+00, %entry ]
  %alpha.039 = phi double [ %div, %for.end44 ], [ %sub3, %entry ]
  %2 = zext i2 %indvars.iv9 to i64
  %3 = add nuw nsw i64 %indvars.iv60, 1
  %mul = fmul double %alpha.039, %alpha.039
  %4 = add nsw i64 %indvars.iv62, -1
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body8.prol.loopexit, label %for.body8.prol.preheader

for.body8.prol.preheader:                         ; preds = %for.body8.lr.ph
  br label %for.body8.prol

for.body8.prol:                                   ; preds = %for.body8.prol, %for.body8.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body8.prol ], [ 0, %for.body8.prol.preheader ]
  %sum.033.prol = phi double [ %add.prol, %for.body8.prol ], [ 0.000000e+00, %for.body8.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body8.prol ], [ %xtraiter, %for.body8.prol.preheader ]
  %5 = sub nsw i64 %4, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %5
  %6 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %7 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %6, %7
  %add.prol = fadd double %sum.033.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body8.prol.loopexit.unr-lcssa, label %for.body8.prol, !llvm.loop !1

for.body8.prol.loopexit.unr-lcssa:                ; preds = %for.body8.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol.loopexit.unr-lcssa, %for.body8.lr.ph
  %add.lcssa.unr = phi double [ undef, %for.body8.lr.ph ], [ %add.prol, %for.body8.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %for.body8.lr.ph ], [ %2, %for.body8.prol.loopexit.unr-lcssa ]
  %sum.033.unr = phi double [ 0.000000e+00, %for.body8.lr.ph ], [ %add.prol, %for.body8.prol.loopexit.unr-lcssa ]
  %8 = icmp ult i64 %indvars.iv60, 3
  br i1 %8, label %for.body21.lr.ph, label %for.body8.lr.ph.new

for.body8.lr.ph.new:                              ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body8.lr.ph.new ], [ %indvars.iv.next.3, %for.body8 ]
  %sum.033 = phi double [ %sum.033.unr, %for.body8.lr.ph.new ], [ %add.3, %for.body8 ]
  %9 = sub nsw i64 %4, %indvars.iv
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %9
  %10 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %11 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %10, %11
  %add = fadd double %sum.033, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = sub nsw i64 %4, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %12
  %13 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %13, %14
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = sub nsw i64 %4, %indvars.iv.next.1
  %arrayidx11.2 = getelementptr inbounds double, double* %r, i64 %15
  %16 = load double, double* %arrayidx11.2, align 8
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %17 = load double, double* %arrayidx13.2, align 8
  %mul14.2 = fmul double %16, %17
  %add.2 = fadd double %add.1, %mul14.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %18 = sub nsw i64 %4, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %18
  %19 = load double, double* %arrayidx11.3, align 8
  %arrayidx13.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %20 = load double, double* %arrayidx13.3, align 8
  %mul14.3 = fmul double %19, %20
  %add.3 = fadd double %add.2, %mul14.3
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %indvars.iv60
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond.3, label %for.body21.lr.ph.unr-lcssa, label %for.body8

for.body21.lr.ph.unr-lcssa:                       ; preds = %for.body8
  br label %for.body21.lr.ph

for.body21.lr.ph:                                 ; preds = %for.body21.lr.ph.unr-lcssa, %for.body8.prol.loopexit
  %add.lcssa = phi double [ %add.lcssa.unr, %for.body8.prol.loopexit ], [ %add.3, %for.body21.lr.ph.unr-lcssa ]
  %21 = shl i64 %indvars.iv60, 3
  %sub4 = fsub double 1.000000e+00, %mul
  %22 = add nuw nsw i64 %indvars.iv60, 1
  %23 = add nuw nsw i64 %21, 8
  %mul5 = fmul double %beta.040, %sub4
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv62
  %24 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %24
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %min.iters.check = icmp ult i64 %22, 4
  br i1 %min.iters.check, label %for.body21.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body21.lr.ph
  %n.vec = and i64 %22, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body21.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert6 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat7 = shufflevector <2 x double> %broadcast.splatinsert6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %25 = getelementptr inbounds double, double* %y, i64 %index
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load2 = load <2 x double>, <2 x double>* %28, align 8
  %29 = sub nsw i64 %4, %index
  %30 = getelementptr inbounds double, double* %y, i64 %29
  %31 = getelementptr double, double* %30, i64 -1
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load3 = load <2 x double>, <2 x double>* %32, align 8
  %reverse = shufflevector <2 x double> %wide.load3, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %33 = getelementptr double, double* %30, i64 -2
  %34 = getelementptr double, double* %33, i64 -1
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load4 = load <2 x double>, <2 x double>* %35, align 8
  %reverse5 = shufflevector <2 x double> %wide.load4, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %36 = fmul <2 x double> %broadcast.splat7, %reverse
  %37 = fmul <2 x double> %broadcast.splat7, %reverse5
  %38 = fadd <2 x double> %wide.load, %36
  %39 = fadd <2 x double> %wide.load2, %37
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %38, <2 x double>* %41, align 16
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %39, <2 x double>* %43, align 16
  %index.next = add i64 %index, 4
  %44 = icmp eq i64 %index.next, %n.vec
  br i1 %44, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %22, %n.vec
  br i1 %cmp.n, label %for.end44, label %for.body21.preheader

for.body21.preheader:                             ; preds = %middle.block, %min.iters.checked, %for.body21.lr.ph
  %indvars.iv45.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body21.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body21

for.body21:                                       ; preds = %for.body21, %for.body21.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.body21 ], [ %indvars.iv45.ph, %for.body21.preheader ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv45
  %45 = load double, double* %arrayidx23, align 8
  %46 = sub nsw i64 %4, %indvars.iv45
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %46
  %47 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %47
  %add29 = fadd double %45, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv45
  store double %add29, double* %arrayidx31, align 8
  %exitcond51 = icmp eq i64 %indvars.iv45, %indvars.iv60
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  br i1 %exitcond51, label %for.end44.loopexit, label %for.body21, !llvm.loop !6

for.end44.loopexit:                               ; preds = %for.body21
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %y58, i8* nonnull %z59, i64 %23, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv62
  store double %div, double* %arrayidx46, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next61, 1999
  %indvars.iv.next10 = add i2 %indvars.iv9, 1
  br i1 %exitcond8, label %for.end49, label %for.body8.lr.ph

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
