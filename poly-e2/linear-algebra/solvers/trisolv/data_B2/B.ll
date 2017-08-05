; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay3 = bitcast i8* %call1 to double*
  %arraydecay4 = bitcast i8* %call2 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
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
  tail call fastcc void @print_array(i32 2000, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %L, double* nocapture %x, double* nocapture %b) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc14.for.body_crit_edge, %entry
  %indvars.iv411 = phi i64 [ 1, %entry ], [ %indvars.iv.next5, %for.inc14.for.body_crit_edge ]
  %indvars.iv610 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.inc14.for.body_crit_edge ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv610
  store double -9.990000e+02, double* %arrayidx, align 8
  %0 = trunc i64 %indvars.iv610 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx2 = getelementptr inbounds double, double* %b, i64 %indvars.iv610
  store double %conv, double* %arrayidx2, align 8
  %1 = trunc i64 %indvars.iv610 to i32
  %sub = add i32 %1, 2001
  %2 = and i64 %indvars.iv610, 1
  %lcmp.mod = icmp eq i64 %2, 0
  br i1 %lcmp.mod, label %for.body6.prol, label %for.body6.prol.loopexit

for.body6.prol:                                   ; preds = %for.body
  %add7.prol = add i32 %1, 2001
  %conv8.prol = sitofp i32 %add7.prol to double
  %mul.prol = fmul double %conv8.prol, 2.000000e+00
  %div.prol = fdiv double %mul.prol, 2.000000e+03
  %arrayidx13.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv610, i64 0
  store double %div.prol, double* %arrayidx13.prol, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body
  %indvars.iv8.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body ]
  %3 = icmp eq i64 %indvars.iv610, 0
  br i1 %3, label %for.inc14, label %for.body.new

for.body.new:                                     ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body.new
  %indvars.iv8 = phi i64 [ %indvars.iv8.unr.ph, %for.body.new ], [ %indvars.iv.next.1, %for.body6 ]
  %4 = sub nsw i64 0, %indvars.iv8
  %5 = trunc i64 %4 to i32
  %add7 = add i32 %sub, %5
  %conv8 = sitofp i32 %add7 to double
  %mul = fmul double %conv8, 2.000000e+00
  %div = fdiv double %mul, 2.000000e+03
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv610, i64 %indvars.iv8
  store double %div, double* %arrayidx13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %6 = trunc i64 %indvars.iv8 to i32
  %7 = xor i32 %6, -1
  %add7.1 = add i32 %sub, %7
  %conv8.1 = sitofp i32 %add7.1 to double
  %mul.1 = fmul double %conv8.1, 2.000000e+00
  %div.1 = fdiv double %mul.1, 2.000000e+03
  %arrayidx13.1 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv610, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx13.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv8, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv411
  br i1 %exitcond.1, label %for.inc14.loopexit, label %for.body6

for.inc14.loopexit:                               ; preds = %for.body6
  br label %for.inc14

for.inc14:                                        ; preds = %for.inc14.loopexit, %for.body6.prol.loopexit
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv610, 1
  %cmp = icmp slt i64 %indvars.iv.next7, 2000
  br i1 %cmp, label %for.inc14.for.body_crit_edge, label %for.end16

for.inc14.for.body_crit_edge:                     ; preds = %for.inc14
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv411, 1
  br label %for.body

for.end16:                                        ; preds = %for.inc14
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32 %n, [2000 x double]* nocapture readonly %L, double* nocapture %x, double* nocapture readonly %b) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv1015 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.end ]
  %arrayidx = getelementptr inbounds double, double* %b, i64 %indvars.iv1015
  %0 = bitcast double* %arrayidx to i64*
  %1 = load i64, i64* %0, align 8
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv1015
  %2 = bitcast double* %arrayidx2 to i64*
  store i64 %1, i64* %2, align 8
  %exitcond12 = icmp eq i64 %indvars.iv1015, 0
  br i1 %exitcond12, label %for.end, label %for.body5.preheader

for.body5.preheader:                              ; preds = %for.body
  %xtraiter = and i64 %indvars.iv1015, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body5.prol.loopexit, label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.preheader
  %arrayidx9.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv1015, i64 0
  %3 = load double, double* %arrayidx9.prol, align 8
  %4 = load double, double* %x, align 8
  %mul.prol = fmul double %3, %4
  %sunkaddr = ptrtoint double* %x to i64
  %sunkaddr20 = mul i64 %indvars.iv1015, 8
  %sunkaddr21 = add i64 %sunkaddr, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  %5 = load double, double* %sunkaddr22, align 8
  %sub.prol = fsub double %5, %mul.prol
  store double %sub.prol, double* %sunkaddr22, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.prol, %for.body5.preheader
  %indvars.iv13.unr.ph = phi i64 [ 1, %for.body5.prol ], [ 0, %for.body5.preheader ]
  %6 = icmp eq i64 %indvars.iv1015, 1
  br i1 %6, label %for.end, label %for.body5.preheader.new

for.body5.preheader.new:                          ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5:                                        ; preds = %for.body5, %for.body5.preheader.new
  %indvars.iv13 = phi i64 [ %indvars.iv13.unr.ph, %for.body5.preheader.new ], [ %indvars.iv.next.1, %for.body5 ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv1015, i64 %indvars.iv13
  %7 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %x, i64 %indvars.iv13
  %8 = load double, double* %arrayidx11, align 8
  %mul = fmul double %7, %8
  %sunkaddr23 = ptrtoint double* %x to i64
  %sunkaddr24 = mul i64 %indvars.iv1015, 8
  %sunkaddr25 = add i64 %sunkaddr23, %sunkaddr24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  %9 = load double, double* %sunkaddr26, align 8
  %sub = fsub double %9, %mul
  store double %sub, double* %sunkaddr26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %arrayidx9.1 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv1015, i64 %indvars.iv.next
  %10 = load double, double* %arrayidx9.1, align 8
  %arrayidx11.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %11 = load double, double* %arrayidx11.1, align 8
  %mul.1 = fmul double %10, %11
  %12 = load double, double* %sunkaddr26, align 8
  %sub.1 = fsub double %12, %mul.1
  store double %sub.1, double* %sunkaddr26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv1015
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body5

for.end.loopexit:                                 ; preds = %for.body5
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body5.prol.loopexit, %for.body
  %13 = ptrtoint double* %x to i64
  %sunkaddr5 = shl nuw nsw i64 %indvars.iv1015, 3
  %sunkaddr6 = add i64 %sunkaddr5, %13
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  %14 = load double, double* %sunkaddr7, align 8
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv1015, i64 %indvars.iv1015
  %15 = load double, double* %arrayidx19, align 8
  %div = fdiv double %14, %15
  store double %div, double* %sunkaddr7, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1015, 1
  %cmp = icmp slt i64 %indvars.iv.next11, 2000
  br i1 %cmp, label %for.body, label %for.end24

for.end24:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %4 = phi %struct._IO_FILE* [ %3, %entry ], [ %8, %for.inc ]
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv2
  %5 = load double, double* %arrayidx, align 8
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %5) #5
  %6 = trunc i64 %indvars.iv2 to i32
  %rem = srem i32 %6, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2000
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
