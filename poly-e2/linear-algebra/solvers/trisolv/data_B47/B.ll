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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %L = alloca [2000 x [2000 x double]]*, align 8
  %x = alloca [2000 x double]*, align 8
  %b = alloca [2000 x double]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2000, i32* %n, align 4
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %0 = bitcast [2000 x [2000 x double]]** %L to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %1 = bitcast [2000 x double]** %x to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %2 = bitcast [2000 x double]** %b to i8**
  store i8* %call2, i8** %2, align 8
  %3 = load i32, i32* %n, align 4
  %4 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %L, align 8
  %arraydecay = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %4, i64 0, i64 0
  %5 = load [2000 x double]*, [2000 x double]** %x, align 8
  %arraydecay3 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  %arraydecay4 = bitcast i8* %call2 to double*
  tail call fastcc void @init_array(i32 %3, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #3
  %6 = load i32, i32* %n, align 4
  %7 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %L, align 8
  %arraydecay5 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 0
  %8 = load [2000 x double]*, [2000 x double]** %x, align 8
  %arraydecay6 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 0, i64 0
  %9 = load [2000 x double]*, [2000 x double]** %b, align 8
  %arraydecay7 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 0, i64 0
  tail call fastcc void @kernel_trisolv(i32 %6, [2000 x double]* %arraydecay5, double* %arraydecay6, double* %arraydecay7)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %10 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %10, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %11 = load i8**, i8*** %argv.addr, align 8
  %12 = load i8*, i8** %11, align 8
  %strcmpload = load i8, i8* %12, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %13 = load i32, i32* %n, align 4
  %14 = load [2000 x double]*, [2000 x double]** %x, align 8
  %arraydecay9 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 0, i64 0
  tail call fastcc void @print_array(i32 %13, double* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  %15 = bitcast [2000 x [2000 x double]]** %L to i8**
  %16 = load i8*, i8** %15, align 8
  tail call void @free(i8* %16) #3
  %17 = bitcast [2000 x double]** %x to i8**
  %18 = load i8*, i8** %17, align 8
  tail call void @free(i8* %18) #3
  %19 = bitcast [2000 x double]** %b to i8**
  %20 = load i8*, i8** %19, align 8
  tail call void @free(i8* %20) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %L.addr = alloca [2000 x double]*, align 8
  %x.addr = alloca double*, align 8
  %b.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [2000 x double]* %L, [2000 x double]** %L.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double* %b, double** %b.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end16

for.body.lr.ph:                                   ; preds = %entry
  %0 = load double*, double** %x.addr, align 8
  %1 = load double*, double** %b.addr, align 8
  %2 = load i32, i32* %n.addr, align 4
  %conv9 = sitofp i32 %2 to double
  %3 = load [2000 x double]*, [2000 x double]** %L.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %4 = sext i32 %i.promoted to i64
  %5 = sext i32 %2 to i64
  %6 = zext i32 %2 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc14, %for.body.lr.ph
  %indvar = phi i32 [ %indvar.next, %for.inc14 ], [ 0, %for.body.lr.ph ]
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.inc14 ], [ %4, %for.body.lr.ph ]
  %indvars.iv9 = phi i32 [ %indvars.iv.next10, %for.inc14 ], [ %i.promoted, %for.body.lr.ph ]
  %7 = add i32 %i.promoted, %indvar
  %arrayidx = getelementptr inbounds double, double* %0, i64 %indvars.iv11
  store double -9.990000e+02, double* %arrayidx, align 8
  %8 = trunc i64 %indvars.iv11 to i32
  %conv = sitofp i32 %8 to double
  %arrayidx2 = getelementptr inbounds double, double* %1, i64 %indvars.iv11
  store double %conv, double* %arrayidx2, align 8
  %cmp42 = icmp slt i64 %indvars.iv11, 0
  br i1 %cmp42, label %for.inc14, label %for.body6.lr.ph

for.body6.lr.ph:                                  ; preds = %for.body
  %9 = add i64 %indvars.iv11, %6
  %wide.trip.count = zext i32 %indvars.iv9 to i64
  %10 = and i32 %7, 1
  %lcmp.mod = icmp eq i32 %10, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %11 = add nsw i64 %9, 1
  %12 = trunc i64 %11 to i32
  %conv8.prol = sitofp i32 %12 to double
  %mul.prol = fmul double %conv8.prol, 2.000000e+00
  %div.prol = fdiv double %mul.prol, %conv9
  %arrayidx13.prol = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv11, i64 0
  store double %div.prol, double* %arrayidx13.prol, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %13 = icmp eq i32 %7, 0
  br i1 %13, label %for.inc14.loopexit, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %14 = sub i64 %9, %indvars.iv
  %15 = add i64 %14, 1
  %16 = trunc i64 %15 to i32
  %conv8 = sitofp i32 %16 to double
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = sub i64 %9, %indvars.iv.next
  %18 = add i64 %17, 1
  %19 = trunc i64 %18 to i32
  %conv8.1 = sitofp i32 %19 to double
  %mul.v.i0.1 = insertelement <2 x double> undef, double %conv8, i32 0
  %mul.v.i0.2 = insertelement <2 x double> %mul.v.i0.1, double %conv8.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, <double 2.000000e+00, double 2.000000e+00>
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv9, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv9, i32 1
  %div = fdiv <2 x double> %mul, %div.v.i1.2
  %20 = bitcast double* %arrayidx13 to <2 x double>*
  store <2 x double> %div, <2 x double>* %20, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc14.loopexit.unr-lcssa, label %for.body6

for.inc14.loopexit.unr-lcssa:                     ; preds = %for.body6
  br label %for.inc14.loopexit

for.inc14.loopexit:                               ; preds = %for.body6.prol.loopexit, %for.inc14.loopexit.unr-lcssa
  br label %for.inc14

for.inc14:                                        ; preds = %for.inc14.loopexit, %for.body
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %cmp = icmp slt i64 %indvars.iv.next12, %5
  %indvars.iv.next10 = add i32 %indvars.iv9, 1
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %cmp, label %for.body, label %for.cond.for.end16_crit_edge

for.cond.for.end16_crit_edge:                     ; preds = %for.inc14
  %21 = trunc i64 %indvars.iv.next12 to i32
  store i32 %21, i32* %i, align 4
  br label %for.end16

for.end16:                                        ; preds = %entry, %for.cond.for.end16_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %L.addr = alloca [2000 x double]*, align 8
  %x.addr = alloca double*, align 8
  %b.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [2000 x double]* %L, [2000 x double]** %L.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double* %b, double** %b.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end24

for.body.lr.ph:                                   ; preds = %entry
  %0 = load double*, double** %b.addr, align 8
  %1 = load double*, double** %x.addr, align 8
  %2 = load [2000 x double]*, [2000 x double]** %L.addr, align 8
  %3 = load i32, i32* %n.addr, align 4
  %i.promoted = load i32, i32* %i, align 4
  %4 = add i32 %i.promoted, -1
  %5 = sext i32 %i.promoted to i64
  %6 = sext i32 %3 to i64
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.lr.ph
  %indvar = phi i32 [ %indvar.next, %for.end ], [ 0, %for.body.lr.ph ]
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.end ], [ %5, %for.body.lr.ph ]
  %indvars.iv7 = phi i32 [ %indvars.iv.next8, %for.end ], [ %4, %for.body.lr.ph ]
  %7 = add i32 %4, %indvar
  %arrayidx = getelementptr inbounds double, double* %0, i64 %indvars.iv9
  %8 = bitcast double* %arrayidx to i64*
  %9 = load i64, i64* %8, align 8
  %arrayidx2 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %10 = bitcast double* %arrayidx2 to i64*
  store i64 %9, i64* %10, align 8
  %cmp42 = icmp sgt i64 %indvars.iv9, 0
  br i1 %cmp42, label %for.body5.lr.ph, label %for.end

for.body5.lr.ph:                                  ; preds = %for.body
  %arrayidx13 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %wide.trip.count = zext i32 %indvars.iv7 to i64
  %11 = and i32 %7, 1
  %lcmp.mod = icmp eq i32 %11, 0
  br i1 %lcmp.mod, label %for.body5.prol.preheader, label %for.body5.prol.loopexit.unr-lcssa

for.body5.prol.preheader:                         ; preds = %for.body5.lr.ph
  br label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.prol.preheader
  %arrayidx9.prol = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv9, i64 0
  %12 = load double, double* %arrayidx9.prol, align 8
  %13 = load double, double* %1, align 8
  %mul.prol = fmul double %12, %13
  %14 = load double, double* %arrayidx13, align 8
  %sub.prol = fsub double %14, %mul.prol
  store double %sub.prol, double* %arrayidx13, align 8
  br label %for.body5.prol.loopexit.unr-lcssa

for.body5.prol.loopexit.unr-lcssa:                ; preds = %for.body5.lr.ph, %for.body5.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body5.prol ], [ 0, %for.body5.lr.ph ]
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.prol.loopexit.unr-lcssa
  %15 = icmp eq i32 %7, 0
  br i1 %15, label %for.end.loopexit, label %for.body5.lr.ph.new

for.body5.lr.ph.new:                              ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5:                                        ; preds = %for.body5, %for.body5.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body5.lr.ph.new ], [ %indvars.iv.next.1, %for.body5 ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %16 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %17 = load double, double* %arrayidx11, align 8
  %mul = fmul double %16, %17
  %18 = load double, double* %arrayidx13, align 8
  %sub = fsub double %18, %mul
  store double %sub, double* %arrayidx13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.1 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx9.1, align 8
  %arrayidx11.1 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %20 = load double, double* %arrayidx11.1, align 8
  %mul.1 = fmul double %19, %20
  %21 = load double, double* %arrayidx13, align 8
  %sub.1 = fsub double %21, %mul.1
  store double %sub.1, double* %arrayidx13, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body5

for.end.loopexit.unr-lcssa:                       ; preds = %for.body5
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body5.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %arrayidx15 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %22 = load double, double* %arrayidx15, align 8
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv9
  %23 = load double, double* %arrayidx19, align 8
  %div = fdiv double %22, %23
  %arrayidx21 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  store double %div, double* %arrayidx21, align 8
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %cmp = icmp slt i64 %indvars.iv.next10, %6
  %indvars.iv.next8 = add i32 %indvars.iv7, 1
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %cmp, label %for.body, label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge:                     ; preds = %for.end
  %24 = trunc i64 %indvars.iv.next10 to i32
  store i32 %24, i32* %i, align 4
  br label %for.end24

for.end24:                                        ; preds = %entry, %for.cond.for.end24_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %x) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %x, double** %x.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp sgt i32 %3, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %4 = load double*, double** %x.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted to i64
  %7 = sext i32 %5 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %9 = load double, double* %arrayidx, align 8
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #5
  %10 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %10, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %12 = trunc i64 %indvars.iv.next to i32
  store i32 %12, i32* %i, align 4
  br label %for.end

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
