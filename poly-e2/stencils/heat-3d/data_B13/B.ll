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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  %0 = zext i32 %n to i64
  %1 = sext i32 %n to i64
  %cmp29 = icmp sgt i32 %n, 0
  br i1 %cmp29, label %for.cond1.preheader.preheader, label %for.end24

for.cond1.preheader.preheader:                    ; preds = %entry
  %conv8 = sitofp i32 %n to double
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %2 = icmp eq i32 %n, 1
  br label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader.preheader, %for.inc22
  %indvars.iv2230 = phi i64 [ %indvars.iv.next23, %for.inc22 ], [ 0, %for.cond1.preheader.preheader ]
  %3 = add nuw nsw i64 %indvars.iv2230, %0
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc19
  %indvars.iv1727 = phi i64 [ %indvars.iv.next18, %for.inc19 ], [ 0, %for.cond4.preheader.preheader ]
  %4 = add i64 %3, %indvars.iv1727
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.cond4.preheader
  %5 = trunc i64 %4 to i32
  %conv.prol = sitofp i32 %5 to double
  %mul.prol = fmul double %conv.prol, 1.000000e+01
  %div.prol = fdiv double %mul.prol, %conv8
  %arrayidx12.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 0
  store double %div.prol, double* %arrayidx12.prol, align 8
  %arrayidx18.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 0
  store double %div.prol, double* %arrayidx18.prol, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.cond4.preheader
  %indvars.iv25.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.cond4.preheader ]
  br i1 %2, label %for.inc19, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv25 = phi i64 [ %indvars.iv.next.1, %for.inc ], [ %indvars.iv25.unr.ph, %for.inc.preheader ]
  %6 = sub i64 %4, %indvars.iv25
  %7 = trunc i64 %6 to i32
  %conv = sitofp i32 %7 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, %conv8
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv25
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv25
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv25, 1
  %8 = sub i64 %4, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %conv.1 = sitofp i32 %9 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, %conv8
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %0
  br i1 %exitcond.1, label %for.inc19.loopexit, label %for.inc

for.inc19.loopexit:                               ; preds = %for.inc
  br label %for.inc19

for.inc19:                                        ; preds = %for.inc19.loopexit, %for.inc.prol.loopexit
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1727, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next18, %0
  br i1 %exitcond21, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2230, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, %1
  br i1 %exitcond, label %for.end24.loopexit, label %for.cond4.preheader.preheader

for.end24.loopexit:                               ; preds = %for.inc22
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  %0 = add i32 %n, -1
  %1 = sext i32 %0 to i64
  %cmp2133 = icmp sgt i32 %0, 1
  %wide.trip.count106 = zext i32 %0 to i64
  %2 = add nsw i64 %wide.trip.count106, -1
  %min.iters.check243 = icmp ult i64 %2, 2
  %n.vec246 = and i64 %2, -2
  %cmp.zero247 = icmp eq i64 %n.vec246, 0
  %ind.end270 = or i64 %2, 1
  %cmp.n271 = icmp eq i64 %2, %n.vec246
  %min.iters.check = icmp ult i64 %2, 2
  %n.vec = and i64 %2, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %2, 1
  %cmp.n = icmp eq i64 %2, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc209
  %storemerge216 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br i1 %cmp2133, label %for.cond8.preheader.preheader.preheader, label %for.inc209

for.cond8.preheader.preheader.preheader:          ; preds = %for.cond1.preheader
  br label %for.cond8.preheader.preheader

for.cond101.preheader:                            ; preds = %for.inc98
  br i1 %cmp2133, label %for.cond109.preheader.preheader.preheader, label %for.inc209

for.cond109.preheader.preheader.preheader:        ; preds = %for.cond101.preheader
  br label %for.cond109.preheader.preheader

for.cond8.preheader.preheader:                    ; preds = %for.cond8.preheader.preheader.preheader, %for.inc98
  %indvar249 = phi i64 [ %indvar.next250, %for.inc98 ], [ 0, %for.cond8.preheader.preheader.preheader ]
  %indvars.iv108134 = phi i64 [ %5, %for.inc98 ], [ 1, %for.cond8.preheader.preheader.preheader ]
  %3 = add i64 %indvar249, 1
  %4 = add i64 %indvar249, 2
  %5 = add nuw nsw i64 %indvars.iv108134, 1
  %6 = add nsw i64 %indvars.iv108134, -1
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.cond8.preheader.preheader, %for.inc95
  %indvar251 = phi i64 [ 0, %for.cond8.preheader.preheader ], [ %indvar.next252, %for.inc95 ]
  %indvars.iv102131 = phi i64 [ 1, %for.cond8.preheader.preheader ], [ %8, %for.inc95 ]
  %7 = add i64 %indvar251, 1
  %scevgep253 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %3, i64 %7, i64 1
  %scevgep255 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %3, i64 %7, i64 %wide.trip.count106
  %scevgep257 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar249, i64 %7, i64 1
  %scevgep259 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %4, i64 %7, i64 %wide.trip.count106
  %8 = add nuw nsw i64 %indvars.iv102131, 1
  %9 = add nsw i64 %indvars.iv102131, -1
  br i1 %min.iters.check243, label %for.inc.preheader, label %min.iters.checked244

min.iters.checked244:                             ; preds = %for.cond8.preheader
  br i1 %cmp.zero247, label %for.inc.preheader, label %vector.memcheck265

vector.memcheck265:                               ; preds = %min.iters.checked244
  %bound0261 = icmp ult double* %scevgep253, %scevgep259
  %bound1262 = icmp ult double* %scevgep257, %scevgep255
  %memcheck.conflict264 = and i1 %bound0261, %bound1262
  br i1 %memcheck.conflict264, label %for.inc.preheader, label %vector.body240.preheader

vector.body240.preheader:                         ; preds = %vector.memcheck265
  br label %vector.body240

vector.body240:                                   ; preds = %vector.body240.preheader, %vector.body240
  %index267 = phi i64 [ %index.next268, %vector.body240 ], [ 0, %vector.body240.preheader ]
  %offset.idx272 = or i64 %index267, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %5, i64 %indvars.iv102131, i64 %offset.idx272
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load276 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %offset.idx272
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load277 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load277, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load276, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %6, i64 %indvars.iv102131, i64 %offset.idx272
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load278 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load278, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %8, i64 %offset.idx272
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load279 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load279, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %9, i64 %offset.idx272
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load280 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load280
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx272, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load281 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load281, %14
  %32 = add nsw i64 %offset.idx272, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load282 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load282
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %wide.load277, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %offset.idx272
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next268 = add i64 %index267, 2
  %41 = icmp eq i64 %index.next268, %n.vec246
  br i1 %41, label %middle.block241, label %vector.body240, !llvm.loop !6

middle.block241:                                  ; preds = %vector.body240
  br i1 %cmp.n271, label %for.inc95, label %for.inc.preheader

for.inc.preheader:                                ; preds = %middle.block241, %vector.memcheck265, %min.iters.checked244, %for.cond8.preheader
  %indvars.iv129.ph = phi i64 [ 1, %vector.memcheck265 ], [ 1, %min.iters.checked244 ], [ 1, %for.cond8.preheader ], [ %ind.end270, %middle.block241 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv129 = phi i64 [ %indvars.iv.next, %for.inc ], [ %indvars.iv129.ph, %for.inc.preheader ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %5, i64 %indvars.iv102131, i64 %indvars.iv129
  %42 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %indvars.iv129
  %43 = load double, double* %arrayidx21, align 8
  %mul = fmul double %43, 2.000000e+00
  %sub22 = fsub double %42, %mul
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %6, i64 %indvars.iv102131, i64 %indvars.iv129
  %44 = load double, double* %arrayidx29, align 8
  %add30 = fadd double %44, %sub22
  %mul31 = fmul double %add30, 1.250000e-01
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %8, i64 %indvars.iv129
  %45 = load double, double* %arrayidx38, align 8
  %sub46 = fsub double %45, %mul
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %9, i64 %indvars.iv129
  %46 = load double, double* %arrayidx53, align 8
  %add54 = fadd double %sub46, %46
  %mul55 = fmul double %add54, 1.250000e-01
  %add56 = fadd double %mul31, %mul55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv129, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %indvars.iv.next
  %47 = load double, double* %arrayidx63, align 8
  %sub71 = fsub double %47, %mul
  %48 = add nsw i64 %indvars.iv129, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %48
  %49 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %49
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %add88 = fadd double %43, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %indvars.iv129
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count106
  br i1 %exitcond, label %for.inc95.loopexit, label %for.inc, !llvm.loop !9

for.inc95.loopexit:                               ; preds = %for.inc
  br label %for.inc95

for.inc95:                                        ; preds = %for.inc95.loopexit, %middle.block241
  %exitcond107 = icmp eq i64 %8, %wide.trip.count106
  %indvar.next252 = add i64 %indvar251, 1
  br i1 %exitcond107, label %for.inc98, label %for.cond8.preheader

for.inc98:                                        ; preds = %for.inc95
  %exitcond221 = icmp eq i64 %5, %1
  %indvar.next250 = add i64 %indvar249, 1
  br i1 %exitcond221, label %for.cond101.preheader, label %for.cond8.preheader.preheader

for.cond109.preheader.preheader:                  ; preds = %for.cond109.preheader.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond109.preheader.preheader.preheader ]
  %indvars.iv123178 = phi i64 [ %52, %for.inc206 ], [ 1, %for.cond109.preheader.preheader.preheader ]
  %50 = add i64 %indvar, 1
  %51 = add i64 %indvar, 2
  %52 = add nuw nsw i64 %indvars.iv123178, 1
  %53 = add nsw i64 %indvars.iv123178, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.cond109.preheader.preheader, %for.inc203
  %indvar225 = phi i64 [ 0, %for.cond109.preheader.preheader ], [ %indvar.next226, %for.inc203 ]
  %indvars.iv117175 = phi i64 [ 1, %for.cond109.preheader.preheader ], [ %55, %for.inc203 ]
  %54 = add i64 %indvar225, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %50, i64 %54, i64 1
  %scevgep228 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %50, i64 %54, i64 %wide.trip.count106
  %scevgep230 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %54, i64 1
  %scevgep232 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %51, i64 %54, i64 %wide.trip.count106
  %55 = add nuw nsw i64 %indvars.iv117175, 1
  %56 = add nsw i64 %indvars.iv117175, -1
  br i1 %min.iters.check, label %for.inc200.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader
  br i1 %cmp.zero, label %for.inc200.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep232
  %bound1 = icmp ult double* %scevgep230, %scevgep228
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %52, i64 %indvars.iv117175, i64 %offset.idx
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %indvars.iv117175, i64 %offset.idx
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load234 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = fmul <2 x double> %wide.load234, <double 2.000000e+00, double 2.000000e+00>
  %62 = fsub <2 x double> %wide.load, %61
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %53, i64 %indvars.iv117175, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load235 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %wide.load235, %62
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %55, i64 %offset.idx
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load236 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = fsub <2 x double> %wide.load236, %61
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %56, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load237 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fadd <2 x double> %69, %wide.load237
  %73 = fmul <2 x double> %72, <double 1.250000e-01, double 1.250000e-01>
  %74 = fadd <2 x double> %66, %73
  %75 = add nuw nsw i64 %offset.idx, 1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %indvars.iv117175, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load238 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fsub <2 x double> %wide.load238, %61
  %79 = add nsw i64 %offset.idx, -1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %indvars.iv117175, i64 %79
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load239 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fadd <2 x double> %78, %wide.load239
  %83 = fmul <2 x double> %82, <double 1.250000e-01, double 1.250000e-01>
  %84 = fadd <2 x double> %74, %83
  %85 = fadd <2 x double> %wide.load234, %84
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv123178, i64 %indvars.iv117175, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  store <2 x double> %85, <2 x double>* %87, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %88 = icmp eq i64 %index.next, %n.vec
  br i1 %88, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc203, label %for.inc200.preheader

for.inc200.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader
  %indvars.iv112173.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc200

for.inc200:                                       ; preds = %for.inc200.preheader, %for.inc200
  %indvars.iv112173 = phi i64 [ %indvars.iv.next113, %for.inc200 ], [ %indvars.iv112173.ph, %for.inc200.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %52, i64 %indvars.iv117175, i64 %indvars.iv112173
  %89 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %indvars.iv117175, i64 %indvars.iv112173
  %90 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %90, 2.000000e+00
  %sub127 = fsub double %89, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %53, i64 %indvars.iv117175, i64 %indvars.iv112173
  %91 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %91, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %55, i64 %indvars.iv112173
  %92 = load double, double* %arrayidx143, align 8
  %sub151 = fsub double %92, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %56, i64 %indvars.iv112173
  %93 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %sub151, %93
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112173, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %indvars.iv117175, i64 %indvars.iv.next113
  %94 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %94, %mul126
  %95 = add nsw i64 %indvars.iv112173, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123178, i64 %indvars.iv117175, i64 %95
  %96 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %96
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %90, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv123178, i64 %indvars.iv117175, i64 %indvars.iv112173
  store double %add193, double* %arrayidx199, align 8
  %exitcond116 = icmp eq i64 %indvars.iv.next113, %wide.trip.count106
  br i1 %exitcond116, label %for.inc203.loopexit, label %for.inc200, !llvm.loop !16

for.inc203.loopexit:                              ; preds = %for.inc200
  br label %for.inc203

for.inc203:                                       ; preds = %for.inc203.loopexit, %middle.block
  %exitcond122 = icmp eq i64 %55, %wide.trip.count106
  %indvar.next226 = add i64 %indvar225, 1
  br i1 %exitcond122, label %for.inc206, label %for.cond109.preheader

for.inc206:                                       ; preds = %for.inc203
  %exitcond223 = icmp eq i64 %52, %1
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond223, label %for.inc209.loopexit, label %for.cond109.preheader.preheader

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond1.preheader, %for.cond101.preheader
  %inc210 = add nuw nsw i32 %storemerge216, 1
  %exitcond127 = icmp eq i32 %inc210, 501
  br i1 %exitcond127, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %3 = sext i32 %n to i64
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %for.cond2.preheader.preheader, label %for.end23

for.cond2.preheader.preheader:                    ; preds = %entry
  %wide.trip.count16 = zext i32 %n to i64
  br label %for.cond5.preheader.preheader

for.cond5.preheader.preheader:                    ; preds = %for.cond2.preheader.preheader, %for.inc21
  %indvars.iv1827 = phi i64 [ %indvars.iv.next19, %for.inc21 ], [ 0, %for.cond2.preheader.preheader ]
  %4 = mul nsw i64 %indvars.iv1827, %3
  %5 = trunc i64 %4 to i32
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.inc18
  %indvars.iv1424 = phi i64 [ %indvars.iv.next15, %for.inc18 ], [ 0, %for.cond5.preheader.preheader ]
  %6 = trunc i64 %indvars.iv1424 to i32
  %mul83 = add i32 %6, %5
  %add = mul i32 %mul83, %n
  %7 = zext i32 %add to i64
  br label %for.body7

for.body7:                                        ; preds = %for.cond5.preheader, %for.inc
  %indvars.iv22 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %8 = add i64 %indvars.iv22, %7
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1827, i64 %indvars.iv1424, i64 %indvars.iv22
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count16
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1424, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1827, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next19, %3
  br i1 %exitcond55, label %for.end23.loopexit, label %for.cond5.preheader.preheader

for.end23.loopexit:                               ; preds = %for.inc21
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
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
