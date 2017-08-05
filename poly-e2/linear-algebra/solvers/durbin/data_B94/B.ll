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
  %.cast = bitcast i8* %call to double*
  tail call fastcc void @init_array(double* %.cast)
  tail call void (...) @polybench_timer_start() #4
  %0 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(double* %.cast, double* %0)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(double* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %r) unnamed_addr #2 {
entry.for.inc_crit_edge:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry.for.inc_crit_edge
  %indvars.iv = phi i64 [ 0, %entry.for.inc_crit_edge ], [ %indvars.iv.next.4, %for.inc ]
  %0 = sub nsw i64 1, %indvars.iv
  %1 = add nsw i64 %0, 2000
  %2 = trunc i64 %1 to i32
  %conv = sitofp i32 %2 to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = sub i64 2000, %indvars.iv
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %5 = sub i64 1999, %indvars.iv
  %6 = trunc i64 %5 to i32
  %conv.2 = sitofp i32 %6 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %7 = sub i64 -2, %indvars.iv
  %8 = add nsw i64 %7, 2000
  %9 = trunc i64 %8 to i32
  %conv.3 = sitofp i32 %9 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %10 = sub i64 -3, %indvars.iv
  %11 = add nsw i64 %10, 2000
  %12 = trunc i64 %11 to i32
  %conv.4 = sitofp i32 %12 to double
  %arrayidx.4 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly %r, double* nocapture %y) unnamed_addr #2 {
for.body.lr.ph:
  %z = alloca [2000 x double], align 16
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %arrayidx31.prol = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 0
  %2 = bitcast [2000 x double]* %z to i8*
  %3 = bitcast double* %y to i8*
  br label %for.body

for.body:                                         ; preds = %for.inc47.for.body_crit_edge, %for.body.lr.ph
  %4 = phi double [ %div4849, %for.inc47.for.body_crit_edge ], [ %sub3, %for.body.lr.ph ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.inc47.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvar = phi i32 [ %indvar.next, %for.inc47.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %5 = phi double [ %mul5, %for.inc47.for.body_crit_edge ], [ 1.000000e+00, %for.body.lr.ph ]
  %6 = zext i32 %indvar to i64
  %7 = shl nuw nsw i64 %6, 3
  %8 = add nuw nsw i64 %7, 8
  %mul = fmul double %4, %4
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %5, %sub4
  %cmp75 = icmp sgt i64 %indvars.iv41, 0
  br i1 %cmp75, label %for.inc.preheader, label %for.end.thread

for.inc.preheader:                                ; preds = %for.body
  %wide.trip.count = zext i32 %indvar to i64
  %9 = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %9, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %sub10.prol = shl i64 %indvars.iv41, 32
  %sext43.prol = add i64 %sub10.prol, -4294967296
  %idxprom.prol = ashr exact i64 %sext43.prol, 32
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %idxprom.prol
  %10 = load double, double* %arrayidx11.prol, align 8
  %11 = load double, double* %y, align 8
  %mul14.prol = fmul double %10, %11
  %add.prol = fadd double %mul14.prol, 0.000000e+00
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %add.lcssa.unr.ph = phi double [ %add.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %add7.unr.ph = phi double [ %add.prol, %for.inc.prol ], [ 0.000000e+00, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %12 = icmp eq i32 %indvar, 0
  br i1 %12, label %for.inc32.preheader, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.end.thread:                                   ; preds = %for.body
  %arrayidx1644 = getelementptr inbounds double, double* %r, i64 %indvars.iv41
  %13 = load double, double* %arrayidx1644, align 8
  %add1745 = fadd double %13, 0.000000e+00
  %sub1846 = fsub double -0.000000e+00, %add1745
  %div47 = fdiv double %sub1846, %mul5
  br label %for.inc47

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %add7 = phi double [ %add7.unr.ph, %for.inc.preheader.new ], [ %add.1, %for.inc ]
  %14 = xor i64 %indvars.iv, 4294967295
  %sub10 = add i64 %indvars.iv41, %14
  %sext43 = shl i64 %sub10, 32
  %idxprom = ashr exact i64 %sext43, 32
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %idxprom
  %15 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %16 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %15, %16
  %add = fadd double %add7, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = xor i64 %indvars.iv.next, 4294967295
  %sub10.1 = add i64 %indvars.iv41, %17
  %sext43.1 = shl i64 %sub10.1, 32
  %idxprom.1 = ashr exact i64 %sext43.1, 32
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %idxprom.1
  %18 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %18, %19
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %for.inc32.preheader.unr-lcssa, label %for.inc

for.inc32.preheader.unr-lcssa:                    ; preds = %for.inc
  br label %for.inc32.preheader

for.inc32.preheader:                              ; preds = %for.inc.prol.loopexit, %for.inc32.preheader.unr-lcssa
  %add.lcssa = phi double [ %add.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %add.1, %for.inc32.preheader.unr-lcssa ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv41
  %20 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %20, %add.lcssa
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %21 = and i32 %indvar, 1
  %lcmp.mod2 = icmp eq i32 %21, 0
  br i1 %lcmp.mod2, label %for.inc32.prol.preheader, label %for.inc32.prol.loopexit.unr-lcssa

for.inc32.prol.preheader:                         ; preds = %for.inc32.preheader
  br label %for.inc32.prol

for.inc32.prol:                                   ; preds = %for.inc32.prol.preheader
  %22 = load double, double* %y, align 8
  %sub25.prol = shl i64 %indvars.iv41, 32
  %sext.prol = add i64 %sub25.prol, -4294967296
  %idxprom26.prol = ashr exact i64 %sext.prol, 32
  %arrayidx27.prol = getelementptr inbounds double, double* %y, i64 %idxprom26.prol
  %23 = load double, double* %arrayidx27.prol, align 8
  %mul28.prol = fmul double %div, %23
  %add29.prol = fadd double %22, %mul28.prol
  store double %add29.prol, double* %arrayidx31.prol, align 16
  br label %for.inc32.prol.loopexit.unr-lcssa

for.inc32.prol.loopexit.unr-lcssa:                ; preds = %for.inc32.preheader, %for.inc32.prol
  %indvars.iv27.unr.ph = phi i64 [ 1, %for.inc32.prol ], [ 0, %for.inc32.preheader ]
  br label %for.inc32.prol.loopexit

for.inc32.prol.loopexit:                          ; preds = %for.inc32.prol.loopexit.unr-lcssa
  %24 = icmp eq i32 %indvar, 0
  br i1 %24, label %for.inc42.preheader, label %for.inc32.preheader.new

for.inc32.preheader.new:                          ; preds = %for.inc32.prol.loopexit
  br label %for.inc32

for.inc42.preheader.unr-lcssa:                    ; preds = %for.inc32
  br label %for.inc42.preheader

for.inc42.preheader:                              ; preds = %for.inc32.prol.loopexit, %for.inc42.preheader.unr-lcssa
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* nonnull %2, i64 %8, i32 8, i1 false)
  br label %for.inc47

for.inc32:                                        ; preds = %for.inc32, %for.inc32.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr.ph, %for.inc32.preheader.new ], [ %indvars.iv.next28.1, %for.inc32 ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv27
  %25 = load double, double* %arrayidx23, align 8
  %26 = xor i64 %indvars.iv27, 4294967295
  %sub25 = add i64 %indvars.iv41, %26
  %sext = shl i64 %sub25, 32
  %idxprom26 = ashr exact i64 %sext, 32
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %idxprom26
  %27 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %27
  %add29 = fadd double %25, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv27
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %arrayidx23.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next28
  %28 = load double, double* %arrayidx23.1, align 8
  %29 = xor i64 %indvars.iv.next28, 4294967295
  %sub25.1 = add i64 %indvars.iv41, %29
  %sext.1 = shl i64 %sub25.1, 32
  %idxprom26.1 = ashr exact i64 %sext.1, 32
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %idxprom26.1
  %30 = load double, double* %arrayidx27.1, align 8
  %mul28.1 = fmul double %div, %30
  %add29.1 = fadd double %28, %mul28.1
  %arrayidx31.1 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv.next28
  store double %add29.1, double* %arrayidx31.1, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next28, %wide.trip.count
  br i1 %exitcond33.1, label %for.inc42.preheader.unr-lcssa, label %for.inc32

for.inc47:                                        ; preds = %for.end.thread, %for.inc42.preheader
  %div4849 = phi double [ %div, %for.inc42.preheader ], [ %div47, %for.end.thread ]
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv41
  store double %div4849, double* %arrayidx46, align 8
  %indvars.iv.next42 = add i64 %indvars.iv41, 1
  %cmp = icmp slt i64 %indvars.iv.next42, 2000
  br i1 %cmp, label %for.inc47.for.body_crit_edge, label %for.end49

for.inc47.for.body_crit_edge:                     ; preds = %for.inc47
  %indvar.next = add i32 %indvar, 1
  br label %for.body

for.end49:                                        ; preds = %for.inc47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.lr.ph ]
  %storemerge2 = phi i32 [ %6, %for.inc ], [ 0, %for.body.lr.ph ]
  %rem = srem i32 %storemerge2, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = trunc i64 %indvars.iv.next to i32
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
