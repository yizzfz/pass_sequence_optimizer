; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay4 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
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
  %1 = bitcast i8* %call to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %0 = zext i32 %n to i64
  %1 = sext i32 %n to i64
  %cmp28 = icmp sgt i32 %n, 0
  br i1 %cmp28, label %for.cond1.preheader.preheader, label %for.end24

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count19 = zext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %conv8 = sitofp i32 %n to double
  %xtraiter = and i64 %wide.trip.count, 1
  %2 = icmp eq i64 %xtraiter, 0
  %3 = icmp eq i32 %n, 1
  br label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.inc22, %for.cond1.preheader.preheader
  %indvars.iv2129 = phi i64 [ %indvars.iv.next22, %for.inc22 ], [ 0, %for.cond1.preheader.preheader ]
  %4 = add nuw nsw i64 %indvars.iv2129, %0
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond4.preheader.preheader
  %indvars.iv1626 = phi i64 [ %indvars.iv.next17, %for.inc19 ], [ 0, %for.cond4.preheader.preheader ]
  %5 = add i64 %4, %indvars.iv1626
  br i1 %2, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.cond4.preheader
  %6 = trunc i64 %5 to i32
  %conv.prol = sitofp i32 %6 to double
  %mul.prol = fmul double %conv.prol, 1.000000e+01
  %div.prol = fdiv double %mul.prol, %conv8
  %arrayidx12.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2129, i64 %indvars.iv1626, i64 0
  store double %div.prol, double* %arrayidx12.prol, align 8
  %arrayidx18.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2129, i64 %indvars.iv1626, i64 0
  store double %div.prol, double* %arrayidx18.prol, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.cond4.preheader, %for.body6.prol
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.cond4.preheader ]
  br i1 %3, label %for.inc19, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv24 = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv24.unr.ph, %for.body6.preheader ]
  %7 = sub i64 %5, %indvars.iv24
  %8 = trunc i64 %7 to i32
  %conv = sitofp i32 %8 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, %conv8
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2129, i64 %indvars.iv1626, i64 %indvars.iv24
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2129, i64 %indvars.iv1626, i64 %indvars.iv24
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv24, 1
  %9 = sub i64 %5, %indvars.iv.next
  %10 = trunc i64 %9 to i32
  %conv.1 = sitofp i32 %10 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, %conv8
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2129, i64 %indvars.iv1626, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2129, i64 %indvars.iv1626, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv24, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.inc19.loopexit, label %for.body6

for.inc19.loopexit:                               ; preds = %for.body6
  br label %for.inc19

for.inc19:                                        ; preds = %for.inc19.loopexit, %for.body6.prol.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1626, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next17, %wide.trip.count19
  br i1 %exitcond20, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2129, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, %1
  br i1 %exitcond, label %for.end24.loopexit, label %for.cond4.preheader.preheader

for.end24.loopexit:                               ; preds = %for.inc22
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %0 = add i32 %n, -1
  %sub = add nsw i32 %n, -1
  %1 = sext i32 %sub to i64
  %wide.trip.count104 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count119 = zext i32 %0 to i64
  %wide.trip.count113 = zext i32 %0 to i64
  %2 = add nsw i64 %wide.trip.count113, -1
  %3 = icmp eq i32 %0, 1
  %cmp2131.not = icmp slt i32 %n, 3
  %brmerge = or i1 %cmp2131.not, %3
  %4 = icmp sgt i32 %0, 1
  %5 = icmp eq i32 %0, 1
  %min.iters.check = icmp ult i64 %2, 2
  %n.vec = and i64 %2, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %2, 1
  %cmp.n = icmp eq i64 %2, %n.vec
  %6 = icmp eq i32 %0, 1
  %min.iters.check19 = icmp ult i64 %2, 2
  %n.vec22 = and i64 %2, -2
  %cmp.zero23 = icmp eq i64 %n.vec22, 0
  %ind.end46 = or i64 %2, 1
  %cmp.n47 = icmp eq i64 %2, %n.vec22
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %storemerge214 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br i1 %brmerge, label %for.cond101.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader.loopexit:                   ; preds = %for.inc98
  br label %for.cond101.preheader

for.cond101.preheader:                            ; preds = %for.cond101.preheader.loopexit, %for.cond1.preheader
  br i1 %4, label %for.cond105.preheader.preheader, label %for.inc209

for.cond105.preheader.preheader:                  ; preds = %for.cond101.preheader
  br label %for.cond105.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar25 = phi i64 [ %indvar.next26, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv106132 = phi i64 [ %indvars.iv.next107, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %7 = add i64 %indvar25, 1
  %8 = add i64 %indvar25, 2
  %9 = add nuw nsw i64 %indvars.iv106132, 1
  %10 = add nsw i64 %indvars.iv106132, -1
  br i1 %6, label %for.inc98, label %for.cond8.preheader.preheader

for.cond8.preheader.preheader:                    ; preds = %for.cond4.preheader
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.cond8.preheader.preheader, %for.inc95
  %indvar27 = phi i64 [ %indvar.next28, %for.inc95 ], [ 0, %for.cond8.preheader.preheader ]
  %indvars.iv100129 = phi i64 [ %indvars.iv.next101, %for.inc95 ], [ 1, %for.cond8.preheader.preheader ]
  %11 = add i64 %indvar27, 1
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %7, i64 %11, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %7, i64 %11, i64 %wide.trip.count113
  %scevgep33 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar25, i64 %11, i64 1
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %8, i64 %11, i64 %wide.trip.count113
  %12 = add nuw nsw i64 %indvars.iv100129, 1
  %13 = add nsw i64 %indvars.iv100129, -1
  br i1 %min.iters.check19, label %for.body11.preheader, label %min.iters.checked20

min.iters.checked20:                              ; preds = %for.cond8.preheader
  br i1 %cmp.zero23, label %for.body11.preheader, label %vector.memcheck41

vector.memcheck41:                                ; preds = %min.iters.checked20
  %bound037 = icmp ult double* %scevgep29, %scevgep35
  %bound138 = icmp ult double* %scevgep33, %scevgep31
  %memcheck.conflict40 = and i1 %bound037, %bound138
  br i1 %memcheck.conflict40, label %for.body11.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %vector.memcheck41
  br label %vector.body16

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index43 = phi i64 [ %index.next44, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx48 = or i64 %index43, 1
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %9, i64 %indvars.iv100129, i64 %offset.idx48
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %indvars.iv100129, i64 %offset.idx48
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fmul <2 x double> %wide.load53, <double 2.000000e+00, double 2.000000e+00>
  %19 = fsub <2 x double> %wide.load52, %18
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %10, i64 %indvars.iv100129, i64 %offset.idx48
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %wide.load54, %19
  %23 = fmul <2 x double> %22, <double 1.250000e-01, double 1.250000e-01>
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %12, i64 %offset.idx48
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load55, %18
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %13, i64 %offset.idx48
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %26, %wide.load56
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = fadd <2 x double> %23, %30
  %32 = add nuw nsw i64 %offset.idx48, 1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %indvars.iv100129, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fsub <2 x double> %wide.load57, %18
  %36 = add nsw i64 %offset.idx48, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %indvars.iv100129, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %35, %wide.load58
  %40 = fmul <2 x double> %39, <double 1.250000e-01, double 1.250000e-01>
  %41 = fadd <2 x double> %31, %40
  %42 = fadd <2 x double> %wide.load53, %41
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv106132, i64 %indvars.iv100129, i64 %offset.idx48
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %42, <2 x double>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next44 = add i64 %index43, 2
  %45 = icmp eq i64 %index.next44, %n.vec22
  br i1 %45, label %middle.block17, label %vector.body16, !llvm.loop !6

middle.block17:                                   ; preds = %vector.body16
  br i1 %cmp.n47, label %for.inc95, label %for.body11.preheader

for.body11.preheader:                             ; preds = %middle.block17, %vector.memcheck41, %min.iters.checked20, %for.cond8.preheader
  %indvars.iv127.ph = phi i64 [ 1, %vector.memcheck41 ], [ 1, %min.iters.checked20 ], [ 1, %for.cond8.preheader ], [ %ind.end46, %middle.block17 ]
  br label %for.body11

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv127 = phi i64 [ %indvars.iv.next, %for.body11 ], [ %indvars.iv127.ph, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %9, i64 %indvars.iv100129, i64 %indvars.iv127
  %46 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %indvars.iv100129, i64 %indvars.iv127
  %47 = load double, double* %arrayidx21, align 8
  %mul = fmul double %47, 2.000000e+00
  %sub22 = fsub double %46, %mul
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %10, i64 %indvars.iv100129, i64 %indvars.iv127
  %48 = load double, double* %arrayidx29, align 8
  %add30 = fadd double %48, %sub22
  %mul31 = fmul double %add30, 1.250000e-01
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %12, i64 %indvars.iv127
  %49 = load double, double* %arrayidx38, align 8
  %sub46 = fsub double %49, %mul
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %13, i64 %indvars.iv127
  %50 = load double, double* %arrayidx53, align 8
  %add54 = fadd double %sub46, %50
  %mul55 = fmul double %add54, 1.250000e-01
  %add56 = fadd double %mul31, %mul55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv127, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %indvars.iv100129, i64 %indvars.iv.next
  %51 = load double, double* %arrayidx63, align 8
  %sub71 = fsub double %51, %mul
  %52 = add nsw i64 %indvars.iv127, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv106132, i64 %indvars.iv100129, i64 %52
  %53 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %53
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %add88 = fadd double %47, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv106132, i64 %indvars.iv100129, i64 %indvars.iv127
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc95.loopexit, label %for.body11, !llvm.loop !9

for.inc95.loopexit:                               ; preds = %for.body11
  br label %for.inc95

for.inc95:                                        ; preds = %for.inc95.loopexit, %middle.block17
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100129, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next101, %wide.trip.count104
  %indvar.next28 = add i64 %indvar27, 1
  br i1 %exitcond105, label %for.inc98.loopexit, label %for.cond8.preheader

for.inc98.loopexit:                               ; preds = %for.inc95
  br label %for.inc98

for.inc98:                                        ; preds = %for.inc98.loopexit, %for.cond4.preheader
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106132, 1
  %exitcond219 = icmp eq i64 %indvars.iv.next107, %1
  %indvar.next26 = add i64 %indvar25, 1
  br i1 %exitcond219, label %for.cond101.preheader.loopexit, label %for.cond4.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv121176 = phi i64 [ %indvars.iv.next122, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %54 = add i64 %indvar, 1
  %55 = add i64 %indvar, 2
  %56 = add nuw nsw i64 %indvars.iv121176, 1
  %57 = add nsw i64 %indvars.iv121176, -1
  br i1 %5, label %for.inc206, label %for.cond109.preheader.preheader

for.cond109.preheader.preheader:                  ; preds = %for.cond105.preheader
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.cond109.preheader.preheader, %for.inc203
  %indvar1 = phi i64 [ %indvar.next2, %for.inc203 ], [ 0, %for.cond109.preheader.preheader ]
  %indvars.iv115173 = phi i64 [ %indvars.iv.next116, %for.inc203 ], [ 1, %for.cond109.preheader.preheader ]
  %58 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %54, i64 %58, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %54, i64 %58, i64 %wide.trip.count113
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %58, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %55, i64 %58, i64 %wide.trip.count113
  %59 = add nuw nsw i64 %indvars.iv115173, 1
  %60 = add nsw i64 %indvars.iv115173, -1
  br i1 %min.iters.check, label %for.body112.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader
  br i1 %cmp.zero, label %for.body112.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %56, i64 %indvars.iv115173, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %indvars.iv115173, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %66 = fsub <2 x double> %wide.load, %65
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %57, i64 %indvars.iv115173, i64 %offset.idx
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = fadd <2 x double> %wide.load11, %66
  %70 = fmul <2 x double> %69, <double 1.250000e-01, double 1.250000e-01>
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %59, i64 %offset.idx
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fsub <2 x double> %wide.load12, %65
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %60, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = fadd <2 x double> %73, %wide.load13
  %77 = fmul <2 x double> %76, <double 1.250000e-01, double 1.250000e-01>
  %78 = fadd <2 x double> %70, %77
  %79 = add nuw nsw i64 %offset.idx, 1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %indvars.iv115173, i64 %79
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fsub <2 x double> %wide.load14, %65
  %83 = add nsw i64 %offset.idx, -1
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %indvars.iv115173, i64 %83
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %82, %wide.load15
  %87 = fmul <2 x double> %86, <double 1.250000e-01, double 1.250000e-01>
  %88 = fadd <2 x double> %78, %87
  %89 = fadd <2 x double> %wide.load10, %88
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121176, i64 %indvars.iv115173, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  store <2 x double> %89, <2 x double>* %91, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %92 = icmp eq i64 %index.next, %n.vec
  br i1 %92, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc203, label %for.body112.preheader

for.body112.preheader:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader
  %indvars.iv110171.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader ], [ %ind.end, %middle.block ]
  br label %for.body112

for.body112:                                      ; preds = %for.body112.preheader, %for.body112
  %indvars.iv110171 = phi i64 [ %indvars.iv.next111, %for.body112 ], [ %indvars.iv110171.ph, %for.body112.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %56, i64 %indvars.iv115173, i64 %indvars.iv110171
  %93 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %indvars.iv115173, i64 %indvars.iv110171
  %94 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %94, 2.000000e+00
  %sub127 = fsub double %93, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %57, i64 %indvars.iv115173, i64 %indvars.iv110171
  %95 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %95, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %59, i64 %indvars.iv110171
  %96 = load double, double* %arrayidx143, align 8
  %sub151 = fsub double %96, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %60, i64 %indvars.iv110171
  %97 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %sub151, %97
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110171, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %indvars.iv115173, i64 %indvars.iv.next111
  %98 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %98, %mul126
  %99 = add nsw i64 %indvars.iv110171, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv121176, i64 %indvars.iv115173, i64 %99
  %100 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %100
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %94, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv121176, i64 %indvars.iv115173, i64 %indvars.iv110171
  store double %add193, double* %arrayidx199, align 8
  %exitcond114 = icmp eq i64 %indvars.iv.next111, %wide.trip.count113
  br i1 %exitcond114, label %for.inc203.loopexit, label %for.body112, !llvm.loop !16

for.inc203.loopexit:                              ; preds = %for.body112
  br label %for.inc203

for.inc203:                                       ; preds = %for.inc203.loopexit, %middle.block
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115173, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next116, %wide.trip.count119
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %exitcond120, label %for.inc206.loopexit, label %for.cond109.preheader

for.inc206.loopexit:                              ; preds = %for.inc203
  br label %for.inc206

for.inc206:                                       ; preds = %for.inc206.loopexit, %for.cond105.preheader
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121176, 1
  %exitcond221 = icmp eq i64 %indvars.iv.next122, %1
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond221, label %for.inc209.loopexit, label %for.cond105.preheader

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond101.preheader
  %inc210 = add nuw nsw i32 %storemerge214, 1
  %exitcond125 = icmp eq i32 %inc210, 501
  br i1 %exitcond125, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %n to i64
  %cmp25 = icmp sgt i32 %n, 0
  br i1 %cmp25, label %for.cond2.preheader.preheader, label %for.end23

for.cond2.preheader.preheader:                    ; preds = %entry
  %wide.trip.count15 = zext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond5.preheader.preheader

for.cond5.preheader.preheader:                    ; preds = %for.inc21, %for.cond2.preheader.preheader
  %indvars.iv1726 = phi i64 [ %indvars.iv.next18, %for.inc21 ], [ 0, %for.cond2.preheader.preheader ]
  %4 = mul nsw i64 %indvars.iv1726, %3
  %5 = trunc i64 %4 to i32
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond5.preheader.preheader
  %indvars.iv1323 = phi i64 [ %indvars.iv.next14, %for.inc18 ], [ 0, %for.cond5.preheader.preheader ]
  %6 = trunc i64 %indvars.iv1323 to i32
  %mul83 = add i32 %6, %5
  %add = mul i32 %mul83, %n
  %7 = zext i32 %add to i64
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %8 = add i64 %indvars.iv21, %7
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %if.end

if.end:                                           ; preds = %for.body7, %if.then
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1726, i64 %indvars.iv1323, i64 %indvars.iv21
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1323, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1726, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next18, %3
  br i1 %exitcond55, label %for.end23.loopexit, label %for.cond5.preheader.preheader

for.end23.loopexit:                               ; preds = %for.inc21
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
