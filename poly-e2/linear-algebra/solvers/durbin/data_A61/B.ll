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
  %arraydecay32 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(double* %arraydecay1, double* %arraydecay32)
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
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.4, %for.inc ]
  %0 = sub nuw nsw i64 2001, %indvars.iv
  %1 = trunc i64 %0 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = sub i64 2000, %indvars.iv
  %3 = trunc i64 %2 to i32
  %conv.1 = sitofp i32 %3 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %4 = sub i64 1999, %indvars.iv
  %5 = trunc i64 %4 to i32
  %conv.2 = sitofp i32 %5 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %6 = sub i64 1998, %indvars.iv
  %7 = trunc i64 %6 to i32
  %conv.3 = sitofp i32 %7 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %8 = sub i64 1997, %indvars.iv
  %9 = trunc i64 %8 to i32
  %conv.4 = sitofp i32 %9 to double
  %arrayidx.4 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly %r, double* nocapture %y) unnamed_addr #2 {
entry:
  %z = alloca [2000 x double], align 16
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %2 = bitcast [2000 x double]* %z to i8*
  %3 = bitcast double* %y to i8*
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc47, %entry
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc47 ], [ 1, %entry ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.inc47 ], [ 0, %entry ]
  %alpha.09 = phi double [ %div, %for.inc47 ], [ %sub3, %entry ]
  %beta.08 = phi double [ %mul5, %for.inc47 ], [ 1.000000e+00, %entry ]
  %4 = add i64 %indvars.iv29, 1
  %5 = add nuw nsw i64 %indvars.iv29, 1
  %mul = fmul double %alpha.09, %alpha.09
  %6 = add nsw i64 %indvars.iv31, -1
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol, %for.inc.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %for.inc.prol.preheader ], [ %indvars.iv.next.prol, %for.inc.prol ]
  %sum.02.prol = phi double [ 0.000000e+00, %for.inc.prol.preheader ], [ %add.prol, %for.inc.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc.prol.preheader ], [ %prol.iter.sub, %for.inc.prol ]
  %7 = sub nsw i64 %6, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %7
  %8 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %9 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %8, %9
  %add.prol = fadd double %sum.02.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol.loopexit.unr-lcssa
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.unr-lcssa ]
  %sum.02.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i64 %indvars.iv29, 3
  br i1 %10, label %for.inc32.lr.ph, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next.3, %for.inc ]
  %sum.02 = phi double [ %sum.02.unr, %for.inc.lr.ph.new ], [ %add.3, %for.inc ]
  %11 = sub nsw i64 %6, %indvars.iv
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %11
  %12 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %13 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %12, %13
  %add = fadd double %sum.02, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = sub nsw i64 %6, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %14
  %15 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %15, %16
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %17 = sub nsw i64 %6, %indvars.iv.next.1
  %arrayidx11.2 = getelementptr inbounds double, double* %r, i64 %17
  %18 = load double, double* %arrayidx11.2, align 8
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %19 = load double, double* %arrayidx13.2, align 8
  %mul14.2 = fmul double %18, %19
  %add.2 = fadd double %add.1, %mul14.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %20 = sub nsw i64 %6, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %20
  %21 = load double, double* %arrayidx11.3, align 8
  %arrayidx13.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %22 = load double, double* %arrayidx13.3, align 8
  %mul14.3 = fmul double %21, %22
  %add.3 = fadd double %add.2, %mul14.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %indvars.iv29
  br i1 %exitcond.3, label %for.inc32.lr.ph.unr-lcssa, label %for.inc

for.inc32.lr.ph.unr-lcssa:                        ; preds = %for.inc
  br label %for.inc32.lr.ph

for.inc32.lr.ph:                                  ; preds = %for.inc.prol.loopexit, %for.inc32.lr.ph.unr-lcssa
  %add.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.inc32.lr.ph.unr-lcssa ]
  %23 = shl i64 %indvars.iv29, 3
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %beta.08, %sub4
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv31
  %24 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %24
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %25 = add nsw i64 %indvars.iv31, -1
  %min.iters.check = icmp ult i64 %5, 4
  br i1 %min.iters.check, label %for.inc32.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc32.lr.ph
  %n.vec = and i64 %5, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc32.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert40 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat41 = shufflevector <2 x double> %broadcast.splatinsert40, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %26 = getelementptr inbounds double, double* %y, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %29, align 8
  %30 = sub nsw i64 %25, %index
  %31 = getelementptr inbounds double, double* %y, i64 %30
  %32 = getelementptr double, double* %31, i64 -1
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %33, align 8
  %reverse = shufflevector <2 x double> %wide.load37, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %34 = getelementptr double, double* %31, i64 -2
  %35 = getelementptr double, double* %34, i64 -1
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %36, align 8
  %reverse39 = shufflevector <2 x double> %wide.load38, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %37 = fmul <2 x double> %broadcast.splat41, %reverse
  %38 = fmul <2 x double> %broadcast.splat41, %reverse39
  %39 = fadd <2 x double> %wide.load, %37
  %40 = fadd <2 x double> %wide.load36, %38
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
  %cmp.n = icmp eq i64 %5, %n.vec
  br i1 %cmp.n, label %for.inc47, label %for.inc32.preheader

for.inc32.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.inc32.lr.ph
  %indvars.iv14.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.inc32.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.preheader, %for.inc32
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.inc32 ], [ %indvars.iv14.ph, %for.inc32.preheader ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv14
  %46 = load double, double* %arrayidx23, align 8
  %47 = sub nsw i64 %25, %indvars.iv14
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %47
  %48 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %48
  %add29 = fadd double %46, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv14
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond20 = icmp eq i64 %indvars.iv14, %indvars.iv29
  br i1 %exitcond20, label %for.inc47.loopexit, label %for.inc32, !llvm.loop !6

for.inc47.loopexit:                               ; preds = %for.inc32
  br label %for.inc47

for.inc47:                                        ; preds = %for.inc47.loopexit, %middle.block
  %49 = add nuw nsw i64 %23, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* nonnull %2, i64 %49, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv31
  store double %div, double* %arrayidx46, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next30, 1999
  br i1 %exitcond42, label %for.end49, label %for.inc.lr.ph

for.end49:                                        ; preds = %for.inc47
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

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
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
