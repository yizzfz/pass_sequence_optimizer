; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  tail call void @init_array(i32 2000, double* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay2 = bitcast i8* %call to double*
  %arraydecay3 = bitcast i8* %call1 to double*
  tail call void @kernel_durbin(i32 2000, double* %arraydecay2, double* %arraydecay3)
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
  tail call void @print_array(i32 2000, double* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, double* nocapture %r) #2 {
entry:
  br i1 true, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  br i1 true, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  br i1 true, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  br i1 false, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ 0, %for.inc.preheader ]
  %0 = sub nsw i64 0, %indvars.iv
  %1 = trunc i64 %0 to i32
  %sub = add i32 %1, 2001
  %conv = sitofp i32 %sub to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv to i32
  %sub.1 = sub i32 2000, %2
  %conv.1 = sitofp i32 %sub.1 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %3 = sub i64 -2, %indvars.iv
  %4 = trunc i64 %3 to i32
  %sub.2 = add i32 %4, 2001
  %conv.2 = sitofp i32 %sub.2 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %5 = sub i64 -3, %indvars.iv
  %6 = trunc i64 %5 to i32
  %sub.3 = add i32 %6, 2001
  %conv.3 = sitofp i32 %sub.3 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond6.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond6.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_durbin(i32 %n, double* nocapture readonly %r, double* nocapture %y) #2 {
entry:
  %y55 = bitcast double* %y to i8*
  %z = alloca [2000 x double], align 16
  %z56 = bitcast [2000 x double]* %z to i8*
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  br i1 true, label %for.body.preheader, label %for.end49

for.body.preheader:                               ; preds = %entry
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %arrayidx31.prol = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 0
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.body.preheader, %for.inc47
  %indvars.iv57 = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next58, %for.inc47 ]
  %indvar = phi i64 [ 0, %for.body.preheader ], [ %indvar.next, %for.inc47 ]
  %2 = phi double [ %sub3, %for.body.preheader ], [ %div, %for.inc47 ]
  %beta.033 = phi double [ 1.000000e+00, %for.body.preheader ], [ %mul5, %for.inc47 ]
  %3 = shl i64 %indvar, 3
  %4 = add nuw nsw i64 %3, 8
  %mul = fmul double %2, %2
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %beta.033, %sub4
  %5 = add nsw i64 %indvars.iv57, -1
  %6 = and i64 %indvar, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %5
  %7 = load double, double* %arrayidx11.prol, align 8
  %8 = load double, double* %y, align 8
  %mul14.prol = fmul double %7, %8
  %add.prol = fadd double %mul14.prol, 0.000000e+00
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %add.lcssa.unr.ph = phi double [ %add.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %sum.026.unr.ph = phi double [ %add.prol, %for.inc.prol ], [ 0.000000e+00, %for.inc.lr.ph ]
  %9 = icmp eq i64 %indvar, 0
  br i1 %9, label %for.inc32.lr.ph, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ %indvars.iv.unr.ph, %for.inc.preheader ]
  %sum.026 = phi double [ %add.1, %for.inc ], [ %sum.026.unr.ph, %for.inc.preheader ]
  %sub10 = sub i64 %5, %indvars.iv
  %sext = shl i64 %sub10, 32
  %idxprom = ashr exact i64 %sext, 32
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %idxprom
  %10 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %11 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %10, %11
  %add = fadd double %sum.026, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = xor i64 %indvars.iv, 4294967295
  %sub10.1 = add i64 %5, %12
  %sext63 = shl i64 %sub10.1, 32
  %idxprom.1 = ashr exact i64 %sext63, 32
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %idxprom.1
  %13 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %13, %14
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv57
  br i1 %exitcond48.1, label %for.inc32.lr.ph.loopexit, label %for.inc

for.inc32.lr.ph.loopexit:                         ; preds = %for.inc
  br label %for.inc32.lr.ph

for.inc32.lr.ph:                                  ; preds = %for.inc32.lr.ph.loopexit, %for.inc.prol.loopexit
  %add.lcssa = phi double [ %add.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %add.1, %for.inc32.lr.ph.loopexit ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv57
  %15 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %15
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %16 = add nsw i64 %indvars.iv57, -1
  %17 = and i64 %indvar, 1
  %lcmp.mod52 = icmp eq i64 %17, 0
  br i1 %lcmp.mod52, label %for.inc32.prol, label %for.inc32.prol.loopexit

for.inc32.prol:                                   ; preds = %for.inc32.lr.ph
  %18 = load double, double* %y, align 8
  %arrayidx27.prol = getelementptr inbounds double, double* %y, i64 %16
  %19 = load double, double* %arrayidx27.prol, align 8
  %mul28.prol = fmul double %div, %19
  %add29.prol = fadd double %18, %mul28.prol
  store double %add29.prol, double* %arrayidx31.prol, align 16
  br label %for.inc32.prol.loopexit

for.inc32.prol.loopexit:                          ; preds = %for.inc32.prol, %for.inc32.lr.ph
  %indvars.iv37.unr.ph = phi i64 [ 1, %for.inc32.prol ], [ 0, %for.inc32.lr.ph ]
  %20 = icmp eq i64 %indvar, 0
  br i1 %20, label %for.inc47, label %for.inc32.preheader

for.inc32.preheader:                              ; preds = %for.inc32.prol.loopexit
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.preheader, %for.inc32
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %for.inc32 ], [ %indvars.iv37.unr.ph, %for.inc32.preheader ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv37
  %21 = load double, double* %arrayidx23, align 8
  %sub25 = sub i64 %16, %indvars.iv37
  %sext64 = shl i64 %sub25, 32
  %idxprom26 = ashr exact i64 %sext64, 32
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %idxprom26
  %22 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %22
  %add29 = fadd double %21, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv37
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %arrayidx23.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next38
  %23 = load double, double* %arrayidx23.1, align 8
  %24 = xor i64 %indvars.iv37, 4294967295
  %sub25.1 = add i64 %16, %24
  %sext65 = shl i64 %sub25.1, 32
  %idxprom26.1 = ashr exact i64 %sext65, 32
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %idxprom26.1
  %25 = load double, double* %arrayidx27.1, align 8
  %mul28.1 = fmul double %div, %25
  %add29.1 = fadd double %23, %mul28.1
  %arrayidx31.1 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv.next38
  store double %add29.1, double* %arrayidx31.1, align 8
  %indvars.iv.next38.1 = add nuw nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next38.1, %indvars.iv57
  br i1 %exitcond.1, label %for.inc47.loopexit, label %for.inc32

for.inc47.loopexit:                               ; preds = %for.inc32
  br label %for.inc47

for.inc47:                                        ; preds = %for.inc47.loopexit, %for.inc32.prol.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %y55, i8* nonnull %z56, i64 %4, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv57
  store double %div, double* %arrayidx46, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 1999
  br i1 %exitcond, label %for.end49.loopexit, label %for.inc.lr.ph

for.end49.loopexit:                               ; preds = %for.inc47
  br label %for.end49

for.end49:                                        ; preds = %for.end49.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* nocapture readonly %y) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
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
  %exitcond5 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond5, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
