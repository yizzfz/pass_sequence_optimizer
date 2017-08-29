; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %5 to [1200 x double]*
  %18 = bitcast i8* %4 to [1200 x double]*
  %19 = bitcast i8* %3 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %19, [1200 x double]* %18, [1200 x double]* %17)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %2, %16
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph14.preheader, label %._crit_edge

.lr.ph14.preheader:                               ; preds = %7
  %9 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph14.prol.loopexit, label %.lr.ph14.prol.preheader

.lr.ph14.prol.preheader:                          ; preds = %.lr.ph14.preheader
  br label %.lr.ph14.prol

.lr.ph14.prol:                                    ; preds = %.lr.ph14.prol, %.lr.ph14.prol.preheader
  %10 = phi i32 [ %14, %.lr.ph14.prol ], [ 0, %.lr.ph14.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph14.prol ], [ %xtraiter, %.lr.ph14.prol.preheader ]
  %11 = sitofp i32 %10 to double
  %12 = sext i32 %10 to i64
  %13 = getelementptr inbounds double, double* %6, i64 %12
  store double %11, double* %13, align 8
  %14 = add nsw i32 %10, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph14.prol.loopexit.unr-lcssa, label %.lr.ph14.prol, !llvm.loop !1

.lr.ph14.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph14.prol
  br label %.lr.ph14.prol.loopexit

.lr.ph14.prol.loopexit:                           ; preds = %.lr.ph14.preheader, %.lr.ph14.prol.loopexit.unr-lcssa
  %.unr = phi i32 [ 0, %.lr.ph14.preheader ], [ %14, %.lr.ph14.prol.loopexit.unr-lcssa ]
  %15 = icmp ult i32 %9, 3
  br i1 %15, label %._crit_edge.loopexit, label %.lr.ph14.preheader.new

.lr.ph14.preheader.new:                           ; preds = %.lr.ph14.prol.loopexit
  br label %.lr.ph14

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph14
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph14.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %7
  %16 = icmp sgt i32 %1, 0
  br i1 %16, label %._crit_edge3.lr.ph, label %.loopexit

._crit_edge3.lr.ph:                               ; preds = %._crit_edge
  %17 = icmp sgt i32 %2, 0
  %18 = sext i32 %1 to i64
  %19 = sitofp i32 %1 to double
  %20 = sitofp i32 %2 to double
  %21 = sext i32 %2 to i64
  br i1 %17, label %._crit_edge3.us.preheader, label %.loopexit

._crit_edge3.us.preheader:                        ; preds = %._crit_edge3.lr.ph
  %22 = insertelement <2 x double> undef, double %19, i32 0
  %23 = insertelement <2 x double> %22, double %20, i32 1
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.preheader, %._crit_edge5.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge5.us ], [ 0, %._crit_edge3.us.preheader ]
  %24 = trunc i64 %indvars.iv19 to i32
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %25, i32 0
  br label %27

; <label>:27:                                     ; preds = %._crit_edge3.us, %27
  %indvars.iv = phi i64 [ 0, %._crit_edge3.us ], [ %indvars.iv.next, %27 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = trunc i64 %indvars.iv.next to i32
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv
  %31 = add nuw nsw i64 %indvars.iv, 2
  %32 = trunc i64 %31 to i32
  %33 = sitofp i32 %32 to double
  %34 = insertelement <2 x double> %26, double %33, i32 1
  %35 = insertelement <2 x double> undef, double %29, i32 0
  %36 = insertelement <2 x double> %35, double %25, i32 1
  %37 = fmul <2 x double> %36, %34
  %38 = fdiv <2 x double> %37, %23
  %39 = extractelement <2 x double> %38, i32 0
  %40 = extractelement <2 x double> %38, i32 1
  store double %39, double* %30, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv
  store double %40, double* %41, align 8
  %42 = add nuw nsw i64 %indvars.iv, 3
  %43 = trunc i64 %42 to i32
  %44 = sitofp i32 %43 to double
  %45 = fmul double %25, %44
  %46 = fdiv double %45, %19
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv
  store double %46, double* %47, align 8
  %48 = icmp slt i64 %indvars.iv.next, %21
  br i1 %48, label %27, label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %27
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 1
  %49 = icmp slt i64 %indvars.iv.next20, %18
  br i1 %49, label %._crit_edge3.us, label %.loopexit.loopexit

.lr.ph14:                                         ; preds = %.lr.ph14, %.lr.ph14.preheader.new
  %50 = phi i32 [ %.unr, %.lr.ph14.preheader.new ], [ %68, %.lr.ph14 ]
  %51 = sitofp i32 %50 to double
  %52 = sext i32 %50 to i64
  %53 = getelementptr inbounds double, double* %6, i64 %52
  %54 = bitcast double* %53 to <2 x double>*
  %55 = add nsw i32 %50, 1
  %56 = sitofp i32 %55 to double
  %57 = insertelement <2 x double> undef, double %51, i32 0
  %58 = insertelement <2 x double> %57, double %56, i32 1
  store <2 x double> %58, <2 x double>* %54, align 8
  %59 = add nsw i32 %50, 2
  %60 = sitofp i32 %59 to double
  %61 = sext i32 %59 to i64
  %62 = getelementptr inbounds double, double* %6, i64 %61
  %63 = bitcast double* %62 to <2 x double>*
  %64 = add nsw i32 %50, 3
  %65 = sitofp i32 %64 to double
  %66 = insertelement <2 x double> undef, double %60, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  store <2 x double> %67, <2 x double>* %63, align 8
  %68 = add nsw i32 %50, 4
  %69 = icmp slt i32 %68, %0
  br i1 %69, label %.lr.ph14, label %._crit_edge.loopexit.unr-lcssa

.loopexit.loopexit:                               ; preds = %._crit_edge5.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge3.lr.ph, %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %7
  %wide.trip.count.7 = zext i32 %2 to i64
  %wide.trip.count60 = zext i32 %1 to i64
  %9 = add nsw i32 %1, -1
  %10 = sext i32 %2 to i64
  %11 = add nsw i64 %10, -1
  %12 = sext i32 %1 to i64
  %13 = sext i32 %0 to i64
  %14 = add i32 %2, -1
  %15 = and i32 %2, 7
  %16 = add nsw i32 %15, -1
  %17 = zext i32 %16 to i64
  %18 = add nuw nsw i64 %17, 1
  %19 = zext i32 %9 to i64
  %20 = and i32 %2, 1
  %21 = add nsw i64 %10, 1199
  %22 = add nsw i64 %wide.trip.count.7, -2
  %23 = add nsw i64 %wide.trip.count.7, -2
  %24 = icmp sgt i32 %2, 0
  %25 = icmp eq i32 %15, 0
  %26 = icmp ult i32 %14, 7
  %sunkaddr195 = ptrtoint double* %6 to i64
  %sunkaddr = ptrtoint double* %6 to i64
  %27 = icmp sgt i32 %1, 1
  %28 = icmp sgt i32 %2, 0
  %min.iters.check158 = icmp ult i32 %2, 4
  %n.vec161 = and i64 %10, -4
  %cmp.zero162 = icmp eq i64 %n.vec161, 0
  %cmp.n181 = icmp eq i64 %10, %n.vec161
  %29 = icmp sgt i32 %1, 0
  %30 = icmp sgt i32 %2, 1
  %31 = icmp eq i32 %20, 0
  %32 = icmp eq i32 %2, 2
  %.not = icmp slt i32 %1, 2
  %.not89 = icmp slt i32 %2, 2
  %brmerge = or i1 %.not, %.not89
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %11, %n.vec
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.lr.ph, %._crit_edge38
  %indvars.iv75 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next76, %._crit_edge38 ]
  br i1 %24, label %.lr.ph, label %._crit_edge8

.lr.ph:                                           ; preds = %._crit_edge
  br i1 %25, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  %sunkaddr192 = shl i64 %indvars.iv75, 3
  %sunkaddr193 = add i64 %sunkaddr, %sunkaddr192
  %sunkaddr194 = inttoptr i64 %sunkaddr193 to i64*
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %15, %.prol.preheader.preheader ]
  %33 = load i64, i64* %sunkaddr194, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.prol
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %18, %.prol.loopexit.loopexit ]
  br i1 %26, label %._crit_edge8, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr196 = shl i64 %indvars.iv75, 3
  %sunkaddr197 = add i64 %sunkaddr195, %sunkaddr196
  %sunkaddr198 = inttoptr i64 %sunkaddr197 to i64*
  br label %.lr.ph.new

._crit_edge8.loopexit:                            ; preds = %.lr.ph.new
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.prol.loopexit, %._crit_edge
  br i1 %27, label %._crit_edge9.lr.ph, label %._crit_edge10

._crit_edge9.lr.ph:                               ; preds = %._crit_edge8
  br i1 %28, label %._crit_edge9.us.preheader, label %._crit_edge11.lr.ph

._crit_edge9.us.preheader:                        ; preds = %._crit_edge9.lr.ph
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.preheader, %._crit_edge17.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge17.us ], [ 0, %._crit_edge9.us.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge17.us ], [ 1, %._crit_edge9.us.preheader ]
  %36 = add i64 %indvar, 1
  %scevgep164 = getelementptr [1200 x double], [1200 x double]* %4, i64 %36, i64 0
  %scevgep166 = getelementptr [1200 x double], [1200 x double]* %4, i64 %36, i64 %10
  %scevgep168 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep170 = getelementptr [1200 x double], [1200 x double]* %5, i64 %36, i64 %10
  %37 = add nsw i64 %indvars.iv58, -1
  br i1 %min.iters.check158, label %scalar.ph157.preheader, label %min.iters.checked159

min.iters.checked159:                             ; preds = %._crit_edge9.us
  br i1 %cmp.zero162, label %scalar.ph157.preheader, label %vector.memcheck176

vector.memcheck176:                               ; preds = %min.iters.checked159
  %bound0172 = icmp ult double* %scevgep164, %scevgep170
  %bound1173 = icmp ult double* %scevgep168, %scevgep166
  %memcheck.conflict175 = and i1 %bound0172, %bound1173
  br i1 %memcheck.conflict175, label %scalar.ph157.preheader, label %vector.body155.preheader

vector.body155.preheader:                         ; preds = %vector.memcheck176
  br label %vector.body155

vector.body155:                                   ; preds = %vector.body155.preheader, %vector.body155
  %index178 = phi i64 [ %index.next179, %vector.body155 ], [ 0, %vector.body155.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %index178
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load186 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !4, !noalias !7
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load187 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !4, !noalias !7
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv58, i64 %index178
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load188 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !7
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load189 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !7
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %37, i64 %index178
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load190 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !7
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load191 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !7
  %50 = fsub <2 x double> %wide.load188, %wide.load190
  %51 = fsub <2 x double> %wide.load189, %wide.load191
  %52 = fmul <2 x double> %50, <double 5.000000e-01, double 5.000000e-01>
  %53 = fmul <2 x double> %51, <double 5.000000e-01, double 5.000000e-01>
  %54 = fsub <2 x double> %wide.load186, %52
  %55 = fsub <2 x double> %wide.load187, %53
  %56 = bitcast double* %38 to <2 x double>*
  store <2 x double> %54, <2 x double>* %56, align 8, !alias.scope !4, !noalias !7
  %57 = bitcast double* %40 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !4, !noalias !7
  %index.next179 = add i64 %index178, 4
  %58 = icmp eq i64 %index.next179, %n.vec161
  br i1 %58, label %middle.block156, label %vector.body155, !llvm.loop !9

middle.block156:                                  ; preds = %vector.body155
  br i1 %cmp.n181, label %._crit_edge17.us, label %scalar.ph157.preheader

scalar.ph157.preheader:                           ; preds = %middle.block156, %vector.memcheck176, %min.iters.checked159, %._crit_edge9.us
  %indvars.iv56.ph = phi i64 [ 0, %vector.memcheck176 ], [ 0, %min.iters.checked159 ], [ 0, %._crit_edge9.us ], [ %n.vec161, %middle.block156 ]
  br label %scalar.ph157

scalar.ph157:                                     ; preds = %scalar.ph157.preheader, %scalar.ph157
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %scalar.ph157 ], [ %indvars.iv56.ph, %scalar.ph157.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv56
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv58, i64 %indvars.iv56
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %37, i64 %indvars.iv56
  %64 = load double, double* %63, align 8
  %65 = fsub double %62, %64
  %66 = fmul double %65, 5.000000e-01
  %67 = fsub double %60, %66
  store double %67, double* %59, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %68 = icmp slt i64 %indvars.iv.next57, %10
  br i1 %68, label %scalar.ph157, label %._crit_edge17.us.loopexit, !llvm.loop !12

._crit_edge17.us.loopexit:                        ; preds = %scalar.ph157
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block156
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond61, label %._crit_edge10.loopexit, label %._crit_edge9.us

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %69 = load i64, i64* %sunkaddr198, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %72 = load i64, i64* %sunkaddr198, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %75 = load i64, i64* %sunkaddr198, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %78 = load i64, i64* %sunkaddr198, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %81 = load i64, i64* %sunkaddr198, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %84 = load i64, i64* %sunkaddr198, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %87 = load i64, i64* %sunkaddr198, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %90 = load i64, i64* %sunkaddr198, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %._crit_edge8.loopexit, label %.lr.ph.new

._crit_edge10.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge8
  br i1 %29, label %._crit_edge11.lr.ph, label %._crit_edge38

._crit_edge11.lr.ph:                              ; preds = %._crit_edge9.lr.ph, %._crit_edge10
  br i1 %30, label %._crit_edge11.us.preheader, label %._crit_edge12

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge26.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge26.us ], [ 0, %._crit_edge11.us.preheader ]
  %scevgep126 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 2
  %scevgep129 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 -1
  %scevgep132 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 2
  br i1 %31, label %93, label %.prol.loopexit78

; <label>:93:                                     ; preds = %._crit_edge11.us
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 1
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 1
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 0
  %99 = load double, double* %98, align 8
  %100 = fsub double %97, %99
  %101 = fmul double %100, 5.000000e-01
  %102 = fsub double %95, %101
  store double %102, double* %94, align 8
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %93, %._crit_edge11.us
  %indvars.iv62.unr.ph = phi i64 [ 2, %93 ], [ 1, %._crit_edge11.us ]
  br i1 %32, label %._crit_edge26.us, label %._crit_edge11.us.new.preheader

._crit_edge11.us.new.preheader:                   ; preds = %.prol.loopexit78
  %103 = sub nsw i64 %22, %indvars.iv62.unr.ph
  %104 = lshr i64 %103, 1
  %105 = add nuw i64 %104, 1
  %min.iters.check117 = icmp ult i64 %105, 2
  br i1 %min.iters.check117, label %._crit_edge11.us.new.preheader199, label %min.iters.checked118

min.iters.checked118:                             ; preds = %._crit_edge11.us.new.preheader
  %n.mod.vf119 = and i64 %105, 1
  %n.vec120 = sub i64 %105, %n.mod.vf119
  %cmp.zero121 = icmp eq i64 %n.vec120, 0
  br i1 %cmp.zero121, label %._crit_edge11.us.new.preheader199, label %vector.memcheck139

vector.memcheck139:                               ; preds = %min.iters.checked118
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv62.unr.ph
  %106 = sub nsw i64 %23, %indvars.iv62.unr.ph
  %107 = and i64 %106, -2
  %108 = add nsw i64 %indvars.iv62.unr.ph, %107
  %scevgep127 = getelementptr double, double* %scevgep126, i64 %108
  %scevgep130 = getelementptr double, double* %scevgep129, i64 %indvars.iv62.unr.ph
  %scevgep133 = getelementptr double, double* %scevgep132, i64 %108
  %bound0135 = icmp ult double* %scevgep124, %scevgep133
  %bound1136 = icmp ult double* %scevgep130, %scevgep127
  %memcheck.conflict138 = and i1 %bound0135, %bound1136
  %109 = add nuw nsw i64 %indvars.iv62.unr.ph, 2
  %110 = shl nuw i64 %104, 1
  %111 = add i64 %109, %110
  %112 = shl nuw nsw i64 %n.mod.vf119, 1
  %ind.end = sub i64 %111, %112
  br i1 %memcheck.conflict138, label %._crit_edge11.us.new.preheader199, label %vector.body114.preheader

vector.body114.preheader:                         ; preds = %vector.memcheck139
  br label %vector.body114

vector.body114:                                   ; preds = %vector.body114.preheader, %vector.body114
  %index141 = phi i64 [ %index.next142, %vector.body114 ], [ 0, %vector.body114.preheader ]
  %113 = shl i64 %index141, 1
  %offset.idx = or i64 %indvars.iv62.unr.ph, %113
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %offset.idx
  %115 = bitcast double* %114 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %115, align 8, !alias.scope !13, !noalias !16
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec148 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 %offset.idx
  %117 = getelementptr double, double* %116, i64 -1
  %118 = bitcast double* %117 to <4 x double>*
  %wide.vec149 = load <4 x double>, <4 x double>* %118, align 8, !alias.scope !16
  %strided.vec150 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec151 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %119 = fsub <2 x double> %strided.vec151, %strided.vec150
  %120 = fmul <2 x double> %119, <double 5.000000e-01, double 5.000000e-01>
  %121 = fsub <2 x double> %strided.vec, %120
  %122 = add nuw nsw i64 %offset.idx, 1
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %122
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 %122
  %125 = getelementptr double, double* %124, i64 -1
  %126 = bitcast double* %125 to <4 x double>*
  %wide.vec152 = load <4 x double>, <4 x double>* %126, align 8, !alias.scope !16
  %strided.vec153 = shufflevector <4 x double> %wide.vec152, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec154 = shufflevector <4 x double> %wide.vec152, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %127 = fsub <2 x double> %strided.vec154, %strided.vec153
  %128 = fmul <2 x double> %127, <double 5.000000e-01, double 5.000000e-01>
  %129 = fsub <2 x double> %strided.vec148, %128
  %130 = getelementptr double, double* %123, i64 -1
  %131 = bitcast double* %130 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %121, <2 x double> %129, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %131, align 8, !alias.scope !13, !noalias !16
  %index.next142 = add i64 %index141, 2
  %132 = icmp eq i64 %index.next142, %n.vec120
  br i1 %132, label %middle.block115, label %vector.body114, !llvm.loop !18

middle.block115:                                  ; preds = %vector.body114
  %cmp.n144 = icmp eq i64 %n.mod.vf119, 0
  br i1 %cmp.n144, label %._crit_edge26.us, label %._crit_edge11.us.new.preheader199

._crit_edge11.us.new.preheader199:                ; preds = %middle.block115, %vector.memcheck139, %min.iters.checked118, %._crit_edge11.us.new.preheader
  %indvars.iv62.ph = phi i64 [ %indvars.iv62.unr.ph, %vector.memcheck139 ], [ %indvars.iv62.unr.ph, %min.iters.checked118 ], [ %indvars.iv62.unr.ph, %._crit_edge11.us.new.preheader ], [ %ind.end, %middle.block115 ]
  br label %._crit_edge11.us.new

._crit_edge11.us.new:                             ; preds = %._crit_edge11.us.new.preheader199, %._crit_edge11.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %._crit_edge11.us.new ], [ %indvars.iv62.ph, %._crit_edge11.us.new.preheader199 ]
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv62
  %134 = load double, double* %133, align 8
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 %indvars.iv62
  %136 = load double, double* %135, align 8
  %137 = add nsw i64 %indvars.iv62, -1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 %137
  %139 = load double, double* %138, align 8
  %140 = fsub double %136, %139
  %141 = fmul double %140, 5.000000e-01
  %142 = fsub double %134, %141
  store double %142, double* %133, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next63
  %144 = load double, double* %143, align 8
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv66, i64 %indvars.iv.next63
  %146 = load double, double* %145, align 8
  %147 = load double, double* %135, align 8
  %148 = fsub double %146, %147
  %149 = fmul double %148, 5.000000e-01
  %150 = fsub double %144, %149
  store double %150, double* %143, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63.1, %wide.trip.count.7
  br i1 %exitcond65.1, label %._crit_edge26.us.loopexit, label %._crit_edge11.us.new, !llvm.loop !19

._crit_edge26.us.loopexit:                        ; preds = %._crit_edge11.us.new
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %middle.block115, %.prol.loopexit78
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %151 = icmp slt i64 %indvars.iv.next67, %12
  br i1 %151, label %._crit_edge11.us, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge11.lr.ph
  br i1 %brmerge, label %._crit_edge38, label %._crit_edge13.us.preheader

._crit_edge13.us.preheader:                       ; preds = %._crit_edge12
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.preheader, %._crit_edge35.us
  %indvars.iv71 = phi i64 [ %152, %._crit_edge35.us ], [ 0, %._crit_edge13.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv71, i64 0
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv71, i64 %11
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 0
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %10
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 0
  %scevgep99 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %21
  %152 = add nuw nsw i64 %indvars.iv71, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge13.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep95
  %bound1 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict = and i1 %bound0, %bound1
  %bound0101 = icmp ult double* %scevgep, %scevgep99
  %bound1102 = icmp ult double* %scevgep97, %scevgep91
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx = or i1 %found.conflict, %found.conflict103
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv71, i64 %index
  %154 = bitcast double* %153 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %154, align 8, !alias.scope !20, !noalias !23
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %156, align 8, !alias.scope !20, !noalias !23
  %157 = or i64 %index, 1
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %157
  %159 = bitcast double* %158 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %159, align 8, !alias.scope !26
  %160 = getelementptr double, double* %158, i64 2
  %161 = bitcast double* %160 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %161, align 8, !alias.scope !26
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %index
  %163 = bitcast double* %162 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %163, align 8, !alias.scope !26
  %164 = getelementptr double, double* %162, i64 2
  %165 = bitcast double* %164 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %165, align 8, !alias.scope !26
  %166 = fsub <2 x double> %wide.load106, %wide.load108
  %167 = fsub <2 x double> %wide.load107, %wide.load109
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %152, i64 %index
  %169 = bitcast double* %168 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %169, align 8, !alias.scope !27
  %170 = getelementptr double, double* %168, i64 2
  %171 = bitcast double* %170 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %171, align 8, !alias.scope !27
  %172 = fadd <2 x double> %166, %wide.load110
  %173 = fadd <2 x double> %167, %wide.load111
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %index
  %175 = bitcast double* %174 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %175, align 8, !alias.scope !27
  %176 = getelementptr double, double* %174, i64 2
  %177 = bitcast double* %176 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %177, align 8, !alias.scope !27
  %178 = fsub <2 x double> %172, %wide.load112
  %179 = fsub <2 x double> %173, %wide.load113
  %180 = fmul <2 x double> %178, <double 7.000000e-01, double 7.000000e-01>
  %181 = fmul <2 x double> %179, <double 7.000000e-01, double 7.000000e-01>
  %182 = fsub <2 x double> %wide.load, %180
  %183 = fsub <2 x double> %wide.load105, %181
  %184 = bitcast double* %153 to <2 x double>*
  store <2 x double> %182, <2 x double>* %184, align 8, !alias.scope !20, !noalias !23
  %185 = bitcast double* %155 to <2 x double>*
  store <2 x double> %183, <2 x double>* %185, align 8, !alias.scope !20, !noalias !23
  %index.next = add i64 %index, 4
  %186 = icmp eq i64 %index.next, %n.vec
  br i1 %186, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge35.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge13.us
  %indvars.iv69.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge13.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv69 = phi i64 [ %189, %scalar.ph ], [ %indvars.iv69.ph, %scalar.ph.preheader ]
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv69
  %188 = load double, double* %187, align 8
  %189 = add nuw nsw i64 %indvars.iv69, 1
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %189
  %191 = load double, double* %190, align 8
  %192 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %indvars.iv69
  %193 = load double, double* %192, align 8
  %194 = fsub double %191, %193
  %195 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %152, i64 %indvars.iv69
  %196 = load double, double* %195, align 8
  %197 = fadd double %194, %196
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv71, i64 %indvars.iv69
  %199 = load double, double* %198, align 8
  %200 = fsub double %197, %199
  %201 = fmul double %200, 7.000000e-01
  %202 = fsub double %188, %201
  store double %202, double* %187, align 8
  %exitcond = icmp eq i64 %189, %11
  br i1 %exitcond, label %._crit_edge35.us.loopexit, label %scalar.ph, !llvm.loop !29

._crit_edge35.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us.loopexit, %middle.block
  %exitcond88 = icmp eq i64 %152, %19
  br i1 %exitcond88, label %._crit_edge38.loopexit, label %._crit_edge13.us

._crit_edge38.loopexit:                           ; preds = %._crit_edge35.us
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %._crit_edge12, %._crit_edge10
  %indvars.iv.next76 = add nsw i64 %indvars.iv75, 1
  %203 = icmp slt i64 %indvars.iv.next76, %13
  br i1 %203, label %._crit_edge, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge38
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %._crit_edge.lr.ph, label %.loopexit77

._crit_edge.lr.ph:                                ; preds = %5
  %wide.trip.count67 = zext i32 %1 to i64
  %11 = icmp sgt i32 %1, 0
  %12 = sext i32 %0 to i64
  br i1 %11, label %._crit_edge.us.preheader, label %.loopexit77

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge39.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge39.us ], [ 0, %._crit_edge.us.preheader ]
  %13 = mul nsw i64 %12, %indvars.iv69
  br label %14

; <label>:14:                                     ; preds = %._crit_edge12.us, %._crit_edge.us
  %indvars.iv65 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next66, %._crit_edge12.us ]
  %15 = add nsw i64 %13, %indvars.iv65
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge12.us

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %14, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv69, i64 %indvars.iv65
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge39.us, label %14

._crit_edge39.us:                                 ; preds = %._crit_edge12.us
  %indvars.iv.next70 = add nsw i64 %indvars.iv69, 1
  %25 = icmp slt i64 %indvars.iv.next70, %12
  br i1 %25, label %._crit_edge.us, label %.loopexit77.loopexit

.loopexit77.loopexit:                             ; preds = %._crit_edge39.us
  br label %.loopexit77

.loopexit77:                                      ; preds = %.loopexit77.loopexit, %._crit_edge.lr.ph, %5
  %26 = icmp sgt i32 %0, 0
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br i1 %26, label %._crit_edge13.lr.ph, label %.loopexit76

._crit_edge13.lr.ph:                              ; preds = %.loopexit77
  %wide.trip.count59 = zext i32 %1 to i64
  %33 = icmp sgt i32 %1, 0
  %34 = sext i32 %0 to i64
  br i1 %33, label %._crit_edge13.us.preheader, label %.loopexit76

._crit_edge13.us.preheader:                       ; preds = %._crit_edge13.lr.ph
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.preheader, %._crit_edge29.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge29.us ], [ 0, %._crit_edge13.us.preheader ]
  %35 = mul nsw i64 %34, %indvars.iv61
  br label %36

; <label>:36:                                     ; preds = %._crit_edge14.us, %._crit_edge13.us
  %indvars.iv57 = phi i64 [ 0, %._crit_edge13.us ], [ %indvars.iv.next58, %._crit_edge14.us ]
  %37 = add nsw i64 %35, %indvars.iv57
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %._crit_edge14.us

; <label>:41:                                     ; preds = %36
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %42) #5
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %36, %41
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv61, i64 %indvars.iv57
  %45 = load double, double* %44, align 8
  %46 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %45) #6
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge29.us, label %36

._crit_edge29.us:                                 ; preds = %._crit_edge14.us
  %indvars.iv.next62 = add nsw i64 %indvars.iv61, 1
  %47 = icmp slt i64 %indvars.iv.next62, %34
  br i1 %47, label %._crit_edge13.us, label %.loopexit76.loopexit

.loopexit76.loopexit:                             ; preds = %._crit_edge29.us
  br label %.loopexit76

.loopexit76:                                      ; preds = %.loopexit76.loopexit, %._crit_edge13.lr.ph, %.loopexit77
  %48 = icmp sgt i32 %0, 0
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br i1 %48, label %._crit_edge15.lr.ph, label %.loopexit

._crit_edge15.lr.ph:                              ; preds = %.loopexit76
  %wide.trip.count = zext i32 %1 to i64
  %53 = icmp sgt i32 %1, 0
  %54 = sext i32 %0 to i64
  br i1 %53, label %._crit_edge15.us.preheader, label %.loopexit

._crit_edge15.us.preheader:                       ; preds = %._crit_edge15.lr.ph
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.preheader, %._crit_edge20.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge20.us ], [ 0, %._crit_edge15.us.preheader ]
  %55 = mul nsw i64 %54, %indvars.iv55
  br label %56

; <label>:56:                                     ; preds = %._crit_edge16.us, %._crit_edge15.us
  %indvars.iv = phi i64 [ 0, %._crit_edge15.us ], [ %indvars.iv.next, %._crit_edge16.us ]
  %57 = add nsw i64 %55, %indvars.iv
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, 20
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %._crit_edge16.us

; <label>:61:                                     ; preds = %56
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %62) #5
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %56, %61
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %65) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge20.us, label %56

._crit_edge20.us:                                 ; preds = %._crit_edge16.us
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, 1
  %67 = icmp slt i64 %indvars.iv.next56, %54
  br i1 %67, label %._crit_edge15.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge20.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge15.lr.ph, %.loopexit76
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %69 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !22}
!26 = !{!24}
!27 = !{!25}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
