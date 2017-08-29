; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #0 {
  %6 = sitofp i32 %0 to double
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph57, label %._crit_edge70

.lr.ph57:                                         ; preds = %5
  %8 = sext i32 %0 to i64
  %xtraiter197 = and i64 %8, 1
  %lcmp.mod198 = icmp eq i64 %xtraiter197, 0
  br i1 %lcmp.mod198, label %._crit_edge69.prol.loopexit, label %._crit_edge69.prol.preheader

._crit_edge69.prol.preheader:                     ; preds = %.lr.ph57
  br label %._crit_edge69.prol

._crit_edge69.prol:                               ; preds = %._crit_edge69.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %9 = fdiv double 1.000000e+00, %6
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  store double %11, double* %2, align 8
  br label %._crit_edge69.prol.loopexit

._crit_edge69.prol.loopexit:                      ; preds = %.lr.ph57, %._crit_edge69.prol
  %indvars.iv131.unr = phi i64 [ 0, %.lr.ph57 ], [ 1, %._crit_edge69.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %._crit_edge, label %.lr.ph57.new

.lr.ph57.new:                                     ; preds = %._crit_edge69.prol.loopexit
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %.lr.ph57.new
  %indvars.iv131 = phi i64 [ %indvars.iv131.unr, %.lr.ph57.new ], [ %indvars.iv.next132.1, %._crit_edge69 ]
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv131
  %14 = bitcast double* %13 to <2 x double>*
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv131
  %16 = bitcast double* %15 to <2 x double>*
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %17 = trunc i64 %indvars.iv.next132 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv131
  store <2 x double> zeroinitializer, <2 x double>* %14, align 8
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  %indvars.iv.next132.1 = add nsw i64 %indvars.iv131, 2
  %20 = trunc i64 %indvars.iv.next132.1 to i32
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %6, i32 0
  %23 = insertelement <2 x double> %22, double %6, i32 1
  %24 = insertelement <2 x double> undef, double %18, i32 0
  %25 = insertelement <2 x double> %24, double %21, i32 1
  %26 = fdiv <2 x double> %25, %23
  %27 = fmul <2 x double> %26, <double 5.000000e-01, double 5.000000e-01>
  %28 = fadd <2 x double> %27, <double 4.000000e+00, double 4.000000e+00>
  %29 = bitcast double* %19 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8
  %30 = icmp slt i64 %indvars.iv.next132.1, %8
  br i1 %30, label %._crit_edge69, label %._crit_edge.unr-lcssa

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge69
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge69.prol.loopexit, %._crit_edge.unr-lcssa
  %31 = add i32 %0, -2
  %32 = zext i32 %31 to i64
  br label %33

; <label>:33:                                     ; preds = %.._crit_edge46_crit_edge, %._crit_edge
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %.._crit_edge46_crit_edge ], [ 0, %._crit_edge ]
  %indvar124 = phi i64 [ %34, %.._crit_edge46_crit_edge ], [ 0, %._crit_edge ]
  %indvars.iv116 = phi i32 [ %indvars.iv.next117, %.._crit_edge46_crit_edge ], [ 0, %._crit_edge ]
  %34 = add i64 %indvar124, 1
  %sext = shl i64 %34, 32
  %35 = ashr exact i64 %sext, 32
  %scevgep127 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvar124, i64 %35
  %36 = sub i64 %32, %indvar124
  %37 = shl i64 %36, 3
  %38 = and i64 %37, 34359738360
  %39 = add nuw nsw i64 %38, 8
  %40 = icmp sgt i64 %indvars.iv129, -1
  br i1 %40, label %.lr.ph40.preheader, label %._crit_edge41

.lr.ph40.preheader:                               ; preds = %33
  %wide.trip.count118 = zext i32 %indvars.iv116 to i64
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %.lr.ph40, %.lr.ph40.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %.lr.ph40 ], [ 0, %.lr.ph40.preheader ]
  %41 = sub nsw i64 0, %indvars.iv112
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %0
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, %6
  %46 = fadd double %45, 1.000000e+00
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %indvars.iv112
  store double %46, double* %47, align 8
  %exitcond119 = icmp eq i64 %indvars.iv112, %wide.trip.count118
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  br i1 %exitcond119, label %._crit_edge41.loopexit, label %.lr.ph40

._crit_edge41.loopexit:                           ; preds = %.lr.ph40
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %33
  %indvars.iv.next130 = add i64 %indvars.iv129, 1
  %48 = icmp slt i64 %indvars.iv.next130, %8
  br i1 %48, label %.._crit_edge46_crit_edge, label %._crit_edge51.critedge

.._crit_edge46_crit_edge:                         ; preds = %._crit_edge41
  %49 = bitcast double* %scevgep127 to i8*
  call void @llvm.memset.p0i8.i64(i8* %49, i8 0, i64 %39, i32 8, i1 false)
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %50, align 8
  %indvars.iv.next117 = add i32 %indvars.iv116, 1
  br label %33

._crit_edge51.critedge:                           ; preds = %._crit_edge41
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %51, align 8
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %5, %._crit_edge51.critedge
  %52 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %53 = bitcast i8* %52 to [2000 x [2000 x double]]*
  %54 = bitcast i8* %52 to [2000 x [2000 x double]]*
  br i1 %7, label %.lr.ph33..lr.ph33.split.us_crit_edge, label %._crit_edge76

.lr.ph33..lr.ph33.split.us_crit_edge:             ; preds = %._crit_edge70
  %55 = add i32 %0, -1
  %56 = zext i32 %55 to i64
  %57 = shl nuw nsw i64 %56, 3
  %58 = add nuw nsw i64 %57, 8
  %59 = sext i32 %0 to i64
  %60 = add nsw i64 %59, -1
  %xtraiter194 = and i64 %59, 3
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  br i1 %lcmp.mod195, label %._crit_edge29.us.prol.loopexit, label %._crit_edge29.us.prol.preheader

._crit_edge29.us.prol.preheader:                  ; preds = %.lr.ph33..lr.ph33.split.us_crit_edge
  br label %._crit_edge29.us.prol

._crit_edge29.us.prol:                            ; preds = %._crit_edge29.us.prol, %._crit_edge29.us.prol.preheader
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %prol.iter196 = phi i64 [ %prol.iter196.sub, %._crit_edge29.us.prol ], [ %xtraiter194, %._crit_edge29.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvar.prol, i64 0
  %scevgep108.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.prol, i8 0, i64 %58, i32 8, i1 false)
  %indvars.iv.next110.prol = add i64 %indvars.iv109.prol, 1
  %indvar.next.prol = add i64 %indvar.prol, 1
  %prol.iter196.sub = add i64 %prol.iter196, -1
  %prol.iter196.cmp = icmp eq i64 %prol.iter196.sub, 0
  br i1 %prol.iter196.cmp, label %._crit_edge29.us.prol.loopexit.unr-lcssa, label %._crit_edge29.us.prol, !llvm.loop !1

._crit_edge29.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge29.us.prol
  br label %._crit_edge29.us.prol.loopexit

._crit_edge29.us.prol.loopexit:                   ; preds = %.lr.ph33..lr.ph33.split.us_crit_edge, %._crit_edge29.us.prol.loopexit.unr-lcssa
  %indvars.iv109.unr = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %indvars.iv.next110.prol, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %indvar.next.prol, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %61 = icmp ult i64 %60, 3
  br i1 %61, label %._crit_edge29.us.._crit_edge34_crit_edge, label %.lr.ph33..lr.ph33.split.us_crit_edge.new

.lr.ph33..lr.ph33.split.us_crit_edge.new:         ; preds = %._crit_edge29.us.prol.loopexit
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us, %.lr.ph33..lr.ph33.split.us_crit_edge.new
  %indvars.iv109 = phi i64 [ %indvars.iv109.unr, %.lr.ph33..lr.ph33.split.us_crit_edge.new ], [ %indvars.iv.next110.3, %._crit_edge29.us ]
  %indvar = phi i64 [ %indvar.unr, %.lr.ph33..lr.ph33.split.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge29.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvar, i64 0
  %scevgep108 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108, i8 0, i64 %58, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvar.next, i64 0
  %scevgep108.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.1, i8 0, i64 %58, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvar.next.1, i64 0
  %scevgep108.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.2, i8 0, i64 %58, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvar.next.2, i64 0
  %scevgep108.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.3, i8 0, i64 %58, i32 8, i1 false)
  %indvars.iv.next110.3 = add i64 %indvars.iv109, 4
  %62 = icmp slt i64 %indvars.iv.next110.3, %59
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %62, label %._crit_edge29.us, label %._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa

._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa: ; preds = %._crit_edge29.us
  br label %._crit_edge29.us.._crit_edge34_crit_edge

._crit_edge29.us.._crit_edge34_crit_edge:         ; preds = %._crit_edge29.us.prol.loopexit, %._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa
  br i1 true, label %.lr.ph20, label %._crit_edge76.thread

._crit_edge76.thread:                             ; preds = %._crit_edge29.us.._crit_edge34_crit_edge
  br label %._crit_edge78

.lr.ph20:                                         ; preds = %._crit_edge29.us.._crit_edge34_crit_edge
  %63 = add nuw nsw i64 %56, 1
  %64 = add nuw nsw i64 %56, 1
  %min.iters.check = icmp ult i64 %63, 4
  %n.vec = and i64 %63, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %63, %n.vec
  br label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %._crit_edge10.us.us.._crit_edge14.us_crit_edge, %.lr.ph20
  %indvars.iv103 = phi i64 [ 0, %.lr.ph20 ], [ %65, %._crit_edge10.us.us.._crit_edge14.us_crit_edge ]
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv103
  %65 = add i64 %indvars.iv103, 1
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 %56, i64 %65
  br label %.lr.ph9.us.us

.lr.ph9.us.us:                                    ; preds = %.lr.ph13.us, %._crit_edge10.us.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge10.us.us ], [ 0, %.lr.ph13.us ]
  %scevgep143 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv101, i64 0
  %scevgep145 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv101, i64 %63
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv103
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph9.us.us
  %indvars.iv97.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph9.us.us ], [ %n.vec, %middle.block ]
  %67 = sub nsw i64 %64, %indvars.iv97.ph
  %xtraiter192 = and i64 %67, 1
  %lcmp.mod193 = icmp eq i64 %xtraiter192, 0
  br i1 %lcmp.mod193, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %68 = load double, double* %66, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97.ph, i64 %indvars.iv103
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv101, i64 %indvars.iv97.ph
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %indvars.iv.next98.prol = or i64 %indvars.iv97.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv97.unr.ph = phi i64 [ %indvars.iv.next98.prol, %scalar.ph.prol ], [ %indvars.iv97.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  %75 = icmp eq i64 %56, %indvars.iv97.ph
  br i1 %75, label %._crit_edge10.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.lr.ph9.us.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep143, %scevgep149
  %bound1 = icmp ult double* %scevgep147, %scevgep145
  %found.conflict = and i1 %bound0, %bound1
  %bound0152 = icmp ult double* %scevgep143, %66
  %bound1153 = icmp ult double* %66, %scevgep145
  %found.conflict154 = and i1 %bound0152, %bound1153
  %conflict.rdx = or i1 %found.conflict, %found.conflict154
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %76 = or i64 %index, 1
  %77 = or i64 %index, 2
  %78 = or i64 %index, 3
  %79 = load double, double* %66, align 8, !alias.scope !3
  %80 = insertelement <2 x double> undef, double %79, i32 0
  %81 = shufflevector <2 x double> %80, <2 x double> undef, <2 x i32> zeroinitializer
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv103
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %76, i64 %indvars.iv103
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %77, i64 %indvars.iv103
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %78, i64 %indvars.iv103
  %86 = load double, double* %82, align 8, !alias.scope !6
  %87 = load double, double* %83, align 8, !alias.scope !6
  %88 = load double, double* %84, align 8, !alias.scope !6
  %89 = load double, double* %85, align 8, !alias.scope !6
  %90 = insertelement <2 x double> undef, double %86, i32 0
  %91 = insertelement <2 x double> %90, double %87, i32 1
  %92 = insertelement <2 x double> undef, double %88, i32 0
  %93 = insertelement <2 x double> %92, double %89, i32 1
  %94 = fmul <2 x double> %81, %91
  %95 = fmul <2 x double> %81, %93
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv101, i64 %index
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !8, !noalias !10
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !8, !noalias !10
  %100 = fadd <2 x double> %wide.load, %94
  %101 = fadd <2 x double> %wide.load156, %95
  store <2 x double> %100, <2 x double>* %97, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %101, <2 x double>* %99, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %102 = icmp eq i64 %index.next, %n.vec
  br i1 %102, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge10.us.us, label %scalar.ph.preheader

._crit_edge10.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge10.us.us.loopexit

._crit_edge10.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge10.us.us.loopexit.unr-lcssa
  br label %._crit_edge10.us.us

._crit_edge10.us.us:                              ; preds = %._crit_edge10.us.us.loopexit, %middle.block
  %indvars.iv.next102 = add nuw i64 %indvars.iv101, 1
  %103 = icmp slt i64 %indvars.iv.next102, %59
  br i1 %103, label %.lr.ph9.us.us, label %._crit_edge10.us.us.._crit_edge14.us_crit_edge

._crit_edge10.us.us.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge10.us.us
  %104 = icmp slt i64 %65, %59
  br i1 %104, label %.lr.ph13.us, label %._crit_edge76.loopexit

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next98.1, %scalar.ph ]
  %105 = load double, double* %66, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv103
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %110 = load double, double* %109, align 8
  %111 = fadd double %110, %108
  store double %111, double* %109, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %112 = load double, double* %66, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next98, i64 %indvars.iv103
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %117 = load double, double* %116, align 8
  %118 = fadd double %117, %115
  store double %118, double* %116, align 8
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98, %56
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  br i1 %exitcond100.1, label %._crit_edge10.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !14

._crit_edge76.loopexit:                           ; preds = %._crit_edge10.us.us.._crit_edge14.us_crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.loopexit, %._crit_edge70
  %119 = phi [2000 x [2000 x double]]* [ %53, %._crit_edge70 ], [ %54, %._crit_edge76.loopexit ]
  br i1 %7, label %.lr.ph2..lr.ph2.split.us_crit_edge, label %._crit_edge78

.lr.ph2..lr.ph2.split.us_crit_edge:               ; preds = %._crit_edge76
  %120 = add i32 %0, -1
  %121 = sext i32 %0 to i64
  %wide.trip.count93 = zext i32 %120 to i64
  %122 = add nuw nsw i64 %wide.trip.count93, 1
  %123 = and i64 %122, 8589934588
  %124 = add nsw i64 %123, -4
  %125 = lshr exact i64 %124, 2
  %126 = add nuw nsw i64 %wide.trip.count93, 1
  %min.iters.check160 = icmp ult i64 %122, 4
  %n.vec163 = and i64 %122, 8589934588
  %cmp.zero164 = icmp eq i64 %n.vec163, 0
  %127 = and i64 %125, 1
  %lcmp.mod = icmp eq i64 %127, 0
  %128 = icmp eq i64 %125, 0
  %cmp.n183 = icmp eq i64 %122, %n.vec163
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2..lr.ph2.split.us_crit_edge
  %indvars.iv95 = phi i64 [ 0, %.lr.ph2..lr.ph2.split.us_crit_edge ], [ %indvars.iv.next96, %._crit_edge.us ]
  %scevgep166 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 0
  %scevgep168 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %122
  %scevgep170 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 0
  %scevgep172 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 %122
  br i1 %min.iters.check160, label %scalar.ph159.preheader, label %min.iters.checked161

min.iters.checked161:                             ; preds = %.lr.ph2.split.us
  br i1 %cmp.zero164, label %scalar.ph159.preheader, label %vector.memcheck178

vector.memcheck178:                               ; preds = %min.iters.checked161
  %bound0174 = icmp ult double* %scevgep166, %scevgep172
  %bound1175 = icmp ult double* %scevgep170, %scevgep168
  %memcheck.conflict177 = and i1 %bound0174, %bound1175
  br i1 %memcheck.conflict177, label %scalar.ph159.preheader, label %vector.body157.preheader

vector.body157.preheader:                         ; preds = %vector.memcheck178
  br i1 %lcmp.mod, label %vector.body157.prol.preheader, label %vector.body157.prol.loopexit.unr-lcssa

vector.body157.prol.preheader:                    ; preds = %vector.body157.preheader
  br label %vector.body157.prol

vector.body157.prol:                              ; preds = %vector.body157.prol.preheader
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 0
  %130 = bitcast double* %129 to <2 x i64>*
  %wide.load188.prol = load <2 x i64>, <2 x i64>* %130, align 8, !alias.scope !15
  %131 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 2
  %132 = bitcast double* %131 to <2 x i64>*
  %wide.load189.prol = load <2 x i64>, <2 x i64>* %132, align 8, !alias.scope !15
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 0
  %134 = bitcast double* %133 to <2 x i64>*
  store <2 x i64> %wide.load188.prol, <2 x i64>* %134, align 8, !alias.scope !18, !noalias !15
  %135 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 2
  %136 = bitcast double* %135 to <2 x i64>*
  store <2 x i64> %wide.load189.prol, <2 x i64>* %136, align 8, !alias.scope !18, !noalias !15
  br label %vector.body157.prol.loopexit.unr-lcssa

vector.body157.prol.loopexit.unr-lcssa:           ; preds = %vector.body157.preheader, %vector.body157.prol
  %index180.unr.ph = phi i64 [ 4, %vector.body157.prol ], [ 0, %vector.body157.preheader ]
  br label %vector.body157.prol.loopexit

vector.body157.prol.loopexit:                     ; preds = %vector.body157.prol.loopexit.unr-lcssa
  br i1 %128, label %middle.block158, label %vector.body157.preheader.new

vector.body157.preheader.new:                     ; preds = %vector.body157.prol.loopexit
  br label %vector.body157

vector.body157:                                   ; preds = %vector.body157, %vector.body157.preheader.new
  %index180 = phi i64 [ %index180.unr.ph, %vector.body157.preheader.new ], [ %index.next181.1, %vector.body157 ]
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 %index180
  %138 = bitcast double* %137 to <2 x i64>*
  %wide.load188 = load <2 x i64>, <2 x i64>* %138, align 8, !alias.scope !15
  %139 = getelementptr double, double* %137, i64 2
  %140 = bitcast double* %139 to <2 x i64>*
  %wide.load189 = load <2 x i64>, <2 x i64>* %140, align 8, !alias.scope !15
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %index180
  %142 = bitcast double* %141 to <2 x i64>*
  store <2 x i64> %wide.load188, <2 x i64>* %142, align 8, !alias.scope !18, !noalias !15
  %143 = getelementptr double, double* %141, i64 2
  %144 = bitcast double* %143 to <2 x i64>*
  store <2 x i64> %wide.load189, <2 x i64>* %144, align 8, !alias.scope !18, !noalias !15
  %index.next181 = add i64 %index180, 4
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 %index.next181
  %146 = bitcast double* %145 to <2 x i64>*
  %wide.load188.1 = load <2 x i64>, <2 x i64>* %146, align 8, !alias.scope !15
  %147 = getelementptr double, double* %145, i64 2
  %148 = bitcast double* %147 to <2 x i64>*
  %wide.load189.1 = load <2 x i64>, <2 x i64>* %148, align 8, !alias.scope !15
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %index.next181
  %150 = bitcast double* %149 to <2 x i64>*
  store <2 x i64> %wide.load188.1, <2 x i64>* %150, align 8, !alias.scope !18, !noalias !15
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x i64>*
  store <2 x i64> %wide.load189.1, <2 x i64>* %152, align 8, !alias.scope !18, !noalias !15
  %index.next181.1 = add i64 %index180, 8
  %153 = icmp eq i64 %index.next181.1, %n.vec163
  br i1 %153, label %middle.block158.unr-lcssa, label %vector.body157, !llvm.loop !20

middle.block158.unr-lcssa:                        ; preds = %vector.body157
  br label %middle.block158

middle.block158:                                  ; preds = %vector.body157.prol.loopexit, %middle.block158.unr-lcssa
  br i1 %cmp.n183, label %._crit_edge.us, label %scalar.ph159.preheader

scalar.ph159.preheader:                           ; preds = %middle.block158, %vector.memcheck178, %min.iters.checked161, %.lr.ph2.split.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck178 ], [ 0, %min.iters.checked161 ], [ 0, %.lr.ph2.split.us ], [ %n.vec163, %middle.block158 ]
  %154 = sub nsw i64 %126, %indvars.iv.ph
  %155 = sub nsw i64 %wide.trip.count93, %indvars.iv.ph
  %xtraiter190 = and i64 %154, 3
  %lcmp.mod191 = icmp eq i64 %xtraiter190, 0
  br i1 %lcmp.mod191, label %scalar.ph159.prol.loopexit, label %scalar.ph159.prol.preheader

scalar.ph159.prol.preheader:                      ; preds = %scalar.ph159.preheader
  br label %scalar.ph159.prol

scalar.ph159.prol:                                ; preds = %scalar.ph159.prol, %scalar.ph159.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph159.prol ], [ %indvars.iv.ph, %scalar.ph159.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph159.prol ], [ %xtraiter190, %scalar.ph159.prol.preheader ]
  %156 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %157 = bitcast double* %156 to i64*
  %158 = load i64, i64* %157, align 8
  %159 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.prol
  %160 = bitcast double* %159 to i64*
  store i64 %158, i64* %160, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph159.prol.loopexit.unr-lcssa, label %scalar.ph159.prol, !llvm.loop !21

scalar.ph159.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph159.prol
  br label %scalar.ph159.prol.loopexit

scalar.ph159.prol.loopexit:                       ; preds = %scalar.ph159.preheader, %scalar.ph159.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph159.preheader ], [ %indvars.iv.next.prol, %scalar.ph159.prol.loopexit.unr-lcssa ]
  %161 = icmp ult i64 %155, 3
  br i1 %161, label %._crit_edge.us.loopexit, label %scalar.ph159.preheader.new

scalar.ph159.preheader.new:                       ; preds = %scalar.ph159.prol.loopexit
  br label %scalar.ph159

scalar.ph159:                                     ; preds = %scalar.ph159, %scalar.ph159.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph159.preheader.new ], [ %indvars.iv.next.3, %scalar.ph159 ]
  %162 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %163 = bitcast double* %162 to i64*
  %164 = load i64, i64* %163, align 8
  %165 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv
  %166 = bitcast double* %165 to i64*
  store i64 %164, i64* %166, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %167 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %168 = bitcast double* %167 to i64*
  %169 = load i64, i64* %168, align 8
  %170 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next
  %171 = bitcast double* %170 to i64*
  store i64 %169, i64* %171, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %172 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %173 = bitcast double* %172 to i64*
  %174 = load i64, i64* %173, align 8
  %175 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %176 = bitcast double* %175 to i64*
  store i64 %174, i64* %176, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %177 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %178 = bitcast double* %177 to i64*
  %179 = load i64, i64* %178, align 8
  %180 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %181 = bitcast double* %180 to i64*
  store i64 %179, i64* %181, align 8
  %exitcond94.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count93
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond94.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph159, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph159
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph159.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block158
  %indvars.iv.next96 = add i64 %indvars.iv95, 1
  %182 = icmp slt i64 %indvars.iv.next96, %121
  br i1 %182, label %.lr.ph2.split.us, label %._crit_edge78.loopexit

._crit_edge78.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit, %._crit_edge76, %._crit_edge76.thread
  tail call void @free(i8* %52) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph56, label %._crit_edge76

.lr.ph56:                                         ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count120 = sext i32 %7 to i64
  %9 = add nsw i64 %wide.trip.count120, 1
  br label %._crit_edge48._crit_edge

._crit_edge48._crit_edge:                         ; preds = %._crit_edge48, %.lr.ph56
  %indvars.iv137 = phi i64 [ 0, %.lr.ph56 ], [ %indvars.iv.next138, %._crit_edge48 ]
  %indvars.iv129 = phi i32 [ -1, %.lr.ph56 ], [ %14, %._crit_edge48 ]
  %10 = add i64 %indvars.iv137, 4294967295
  %11 = and i64 %10, 4294967295
  %12 = sub i64 %9, %indvars.iv137
  %13 = sub i64 %wide.trip.count120, %indvars.iv137
  %14 = add i32 %indvars.iv129, 1
  %15 = icmp sgt i64 %indvars.iv137, 0
  br i1 %15, label %.lr.ph32.preheader, label %._crit_edge33

.lr.ph32.preheader:                               ; preds = %._crit_edge48._crit_edge
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %._crit_edge27
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge27 ], [ 0, %.lr.ph32.preheader ]
  %indvars.iv110 = phi i32 [ %19, %._crit_edge27 ], [ -1, %.lr.ph32.preheader ]
  %17 = add i64 %indvars.iv114, 4294967295
  %18 = and i64 %17, 4294967295
  %19 = add i32 %indvars.iv110, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv114
  %21 = load double, double* %20, align 8
  %22 = icmp sgt i64 %indvars.iv114, 0
  br i1 %22, label %.lr.ph26.preheader, label %._crit_edge27

.lr.ph26.preheader:                               ; preds = %.lr.ph32
  %wide.trip.count112 = zext i32 %indvars.iv110 to i64
  %23 = and i64 %17, 1
  %lcmp.mod164 = icmp eq i64 %23, 0
  br i1 %lcmp.mod164, label %.lr.ph26.prol.preheader, label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.preheader:                          ; preds = %.lr.ph26.preheader
  br label %.lr.ph26.prol

.lr.ph26.prol:                                    ; preds = %.lr.ph26.prol.preheader
  %24 = load double, double* %16, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %21, %27
  br label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph26.preheader, %.lr.ph26.prol
  %.lcssa157.unr.ph = phi double [ %28, %.lr.ph26.prol ], [ undef, %.lr.ph26.preheader ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph26.prol ], [ 0, %.lr.ph26.preheader ]
  %.unr165.ph = phi double [ %28, %.lr.ph26.prol ], [ %21, %.lr.ph26.preheader ]
  br label %.lr.ph26.prol.loopexit

.lr.ph26.prol.loopexit:                           ; preds = %.lr.ph26.prol.loopexit.unr-lcssa
  %29 = icmp eq i64 %18, 0
  br i1 %29, label %._crit_edge27.loopexit, label %.lr.ph26.preheader.new

.lr.ph26.preheader.new:                           ; preds = %.lr.ph26.prol.loopexit
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26, %.lr.ph26.preheader.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph26.preheader.new ], [ %indvars.iv.next105.1, %.lr.ph26 ]
  %30 = phi double [ %.unr165.ph, %.lr.ph26.preheader.new ], [ %44, %.lr.ph26 ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv104
  %32 = bitcast double* %31 to <2 x double>*
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv114
  %34 = load double, double* %33, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %35 = load <2 x double>, <2 x double>* %32, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next105, i64 %indvars.iv114
  %37 = load double, double* %36, align 8
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  %40 = fmul <2 x double> %35, %39
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  %43 = fsub double %30, %41
  %44 = fsub double %43, %42
  %exitcond113.1 = icmp eq i64 %indvars.iv.next105, %wide.trip.count112
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  br i1 %exitcond113.1, label %._crit_edge27.loopexit.unr-lcssa, label %.lr.ph26

._crit_edge27.loopexit.unr-lcssa:                 ; preds = %.lr.ph26
  br label %._crit_edge27.loopexit

._crit_edge27.loopexit:                           ; preds = %.lr.ph26.prol.loopexit, %._crit_edge27.loopexit.unr-lcssa
  %.lcssa157 = phi double [ %.lcssa157.unr.ph, %.lr.ph26.prol.loopexit ], [ %44, %._crit_edge27.loopexit.unr-lcssa ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.lr.ph32
  %.lcssa3038 = phi double [ %21, %.lr.ph32 ], [ %.lcssa157, %._crit_edge27.loopexit ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  %46 = load double, double* %45, align 8
  %47 = fdiv double %.lcssa3038, %46
  store double %47, double* %20, align 8
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %48 = icmp slt i64 %indvars.iv.next115, %indvars.iv137
  br i1 %48, label %.lr.ph32, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %._crit_edge27
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %._crit_edge48._crit_edge
  %49 = icmp slt i64 %indvars.iv137, %8
  br i1 %49, label %.lr.ph47, label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge33
  br i1 %15, label %.lr.ph47.split.us.preheader, label %.lr.ph47.split.preheader

.lr.ph47.split.preheader:                         ; preds = %.lr.ph47
  %xtraiter166 = and i64 %12, 7
  %lcmp.mod167 = icmp eq i64 %xtraiter166, 0
  br i1 %lcmp.mod167, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol.preheader

.lr.ph47.split.prol.preheader:                    ; preds = %.lr.ph47.split.preheader
  br label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.prol, %.lr.ph47.split.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.lr.ph47.split.prol ], [ %indvars.iv137, %.lr.ph47.split.prol.preheader ]
  %prol.iter168 = phi i64 [ %prol.iter168.sub, %.lr.ph47.split.prol ], [ %xtraiter166, %.lr.ph47.split.prol.preheader ]
  %indvars.iv.next119.prol = add i64 %indvars.iv118.prol, 1
  %prol.iter168.sub = add i64 %prol.iter168, -1
  %prol.iter168.cmp = icmp eq i64 %prol.iter168.sub, 0
  br i1 %prol.iter168.cmp, label %.lr.ph47.split.prol.loopexit.unr-lcssa, label %.lr.ph47.split.prol, !llvm.loop !23

.lr.ph47.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph47.split.prol
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.preheader, %.lr.ph47.split.prol.loopexit.unr-lcssa
  %indvars.iv118.unr = phi i64 [ %indvars.iv137, %.lr.ph47.split.preheader ], [ %indvars.iv.next119.prol, %.lr.ph47.split.prol.loopexit.unr-lcssa ]
  %50 = icmp ult i64 %13, 7
  br i1 %50, label %._crit_edge48.loopexit152, label %.lr.ph47.split.preheader.new

.lr.ph47.split.preheader.new:                     ; preds = %.lr.ph47.split.prol.loopexit
  br label %.lr.ph47.split

.lr.ph47.split.us.preheader:                      ; preds = %.lr.ph47
  %wide.trip.count131 = zext i32 %indvars.iv129 to i64
  %51 = and i64 %10, 1
  %lcmp.mod172 = icmp eq i64 %51, 0
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  %53 = icmp eq i64 %11, 0
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %.lr.ph47.split.us.preheader, %._crit_edge41.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge41.us ], [ %indvars.iv137, %.lr.ph47.split.us.preheader ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135
  %55 = load double, double* %54, align 8
  br i1 %lcmp.mod172, label %.prol.preheader169, label %.prol.loopexit170.unr-lcssa

.prol.preheader169:                               ; preds = %.lr.ph47.split.us
  br label %56

; <label>:56:                                     ; preds = %.prol.preheader169
  %57 = load double, double* %52, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %55, %60
  br label %.prol.loopexit170.unr-lcssa

.prol.loopexit170.unr-lcssa:                      ; preds = %.lr.ph47.split.us, %56
  %.lcssa158.unr.ph = phi double [ %61, %56 ], [ undef, %.lr.ph47.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %56 ], [ 0, %.lr.ph47.split.us ]
  %.unr173.ph = phi double [ %61, %56 ], [ %55, %.lr.ph47.split.us ]
  br label %.prol.loopexit170

.prol.loopexit170:                                ; preds = %.prol.loopexit170.unr-lcssa
  br i1 %53, label %._crit_edge41.us, label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.prol.loopexit170
  br label %62

; <label>:62:                                     ; preds = %62, %.lr.ph47.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph47.split.us.new ], [ %indvars.iv.next124.1, %62 ]
  %63 = phi double [ %.unr173.ph, %.lr.ph47.split.us.new ], [ %77, %62 ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv123
  %65 = bitcast double* %64 to <2 x double>*
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %67 = load double, double* %66, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %68 = load <2 x double>, <2 x double>* %65, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %70 = load double, double* %69, align 8
  %71 = insertelement <2 x double> undef, double %67, i32 0
  %72 = insertelement <2 x double> %71, double %70, i32 1
  %73 = fmul <2 x double> %68, %72
  %74 = extractelement <2 x double> %73, i32 0
  %75 = extractelement <2 x double> %73, i32 1
  %76 = fsub double %63, %74
  %77 = fsub double %76, %75
  %exitcond132.1 = icmp eq i64 %indvars.iv.next124, %wide.trip.count131
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond132.1, label %._crit_edge41.us.unr-lcssa, label %62

._crit_edge41.us.unr-lcssa:                       ; preds = %62
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %.prol.loopexit170, %._crit_edge41.us.unr-lcssa
  %.lcssa158 = phi double [ %.lcssa158.unr.ph, %.prol.loopexit170 ], [ %77, %._crit_edge41.us.unr-lcssa ]
  store double %.lcssa158, double* %54, align 8
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %78 = icmp slt i64 %indvars.iv.next136, %8
  br i1 %78, label %.lr.ph47.split.us, label %._crit_edge48.loopexit

.lr.ph47.split:                                   ; preds = %.lr.ph47.split, %.lr.ph47.split.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %.lr.ph47.split.preheader.new ], [ %indvars.iv.next119.7, %.lr.ph47.split ]
  %indvars.iv.next119.6 = add i64 %indvars.iv118, 7
  %exitcond121.7 = icmp eq i64 %indvars.iv.next119.6, %wide.trip.count120
  %indvars.iv.next119.7 = add i64 %indvars.iv118, 8
  br i1 %exitcond121.7, label %._crit_edge48.loopexit152.unr-lcssa, label %.lr.ph47.split

._crit_edge48.loopexit:                           ; preds = %._crit_edge41.us
  br label %._crit_edge48

._crit_edge48.loopexit152.unr-lcssa:              ; preds = %.lr.ph47.split
  br label %._crit_edge48.loopexit152

._crit_edge48.loopexit152:                        ; preds = %.lr.ph47.split.prol.loopexit, %._crit_edge48.loopexit152.unr-lcssa
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit152, %._crit_edge48.loopexit, %._crit_edge33
  %indvars.iv.next138 = add i64 %indvars.iv137, 1
  %79 = icmp slt i64 %indvars.iv.next138, %8
  br i1 %79, label %._crit_edge48._crit_edge, label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge48
  br i1 true, label %.lr.ph18, label %._crit_edge57.._crit_edge76_crit_edge

._crit_edge57.._crit_edge76_crit_edge:            ; preds = %._crit_edge57
  br label %._crit_edge76

.lr.ph18:                                         ; preds = %._crit_edge57
  br label %80

; <label>:80:                                     ; preds = %._crit_edge13, %.lr.ph18
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge13 ], [ 0, %.lr.ph18 ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %._crit_edge13 ], [ -1, %.lr.ph18 ]
  %81 = add i64 %indvars.iv102, 4294967295
  %82 = and i64 %81, 4294967295
  %83 = getelementptr inbounds double, double* %2, i64 %indvars.iv102
  %84 = load double, double* %83, align 8
  %85 = icmp sgt i64 %indvars.iv102, 0
  br i1 %85, label %.lr.ph12.preheader, label %._crit_edge13

.lr.ph12.preheader:                               ; preds = %80
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  %xtraiter159 = and i64 %indvars.iv102, 3
  %lcmp.mod160 = icmp eq i64 %xtraiter159, 0
  br i1 %lcmp.mod160, label %.lr.ph12.prol.loopexit, label %.lr.ph12.prol.preheader

.lr.ph12.prol.preheader:                          ; preds = %.lr.ph12.preheader
  br label %.lr.ph12.prol

.lr.ph12.prol:                                    ; preds = %.lr.ph12.prol, %.lr.ph12.prol.preheader
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %.lr.ph12.prol ], [ 0, %.lr.ph12.prol.preheader ]
  %86 = phi double [ %92, %.lr.ph12.prol ], [ %84, %.lr.ph12.prol.preheader ]
  %prol.iter161 = phi i64 [ %prol.iter161.sub, %.lr.ph12.prol ], [ %xtraiter159, %.lr.ph12.prol.preheader ]
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92.prol
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds double, double* %4, i64 %indvars.iv92.prol
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fsub double %86, %91
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter161.sub = add i64 %prol.iter161, -1
  %prol.iter161.cmp = icmp eq i64 %prol.iter161.sub, 0
  br i1 %prol.iter161.cmp, label %.lr.ph12.prol.loopexit.unr-lcssa, label %.lr.ph12.prol, !llvm.loop !24

.lr.ph12.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph12.prol
  br label %.lr.ph12.prol.loopexit

.lr.ph12.prol.loopexit:                           ; preds = %.lr.ph12.preheader, %.lr.ph12.prol.loopexit.unr-lcssa
  %.lcssa156.unr = phi double [ undef, %.lr.ph12.preheader ], [ %92, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph12.preheader ], [ %indvars.iv.next93.prol, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %.unr162 = phi double [ %84, %.lr.ph12.preheader ], [ %92, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %93 = icmp ult i64 %82, 3
  br i1 %93, label %._crit_edge13.loopexit, label %.lr.ph12.preheader.new

.lr.ph12.preheader.new:                           ; preds = %.lr.ph12.prol.loopexit
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12, %.lr.ph12.preheader.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %.lr.ph12.preheader.new ], [ %indvars.iv.next93.3, %.lr.ph12 ]
  %94 = phi double [ %.unr162, %.lr.ph12.preheader.new ], [ %116, %.lr.ph12 ]
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92
  %96 = bitcast double* %95 to <2 x double>*
  %97 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %98 = bitcast double* %97 to <2 x double>*
  %99 = load <2 x double>, <2 x double>* %96, align 8
  %100 = load <2 x double>, <2 x double>* %98, align 8
  %101 = fmul <2 x double> %99, %100
  %102 = extractelement <2 x double> %101, i32 0
  %103 = extractelement <2 x double> %101, i32 1
  %104 = fsub double %94, %102
  %105 = fsub double %104, %103
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next93.1
  %107 = bitcast double* %106 to <2 x double>*
  %108 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next93.1
  %109 = bitcast double* %108 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %110 = load <2 x double>, <2 x double>* %107, align 8
  %111 = load <2 x double>, <2 x double>* %109, align 8
  %112 = fmul <2 x double> %110, %111
  %113 = extractelement <2 x double> %112, i32 0
  %114 = extractelement <2 x double> %112, i32 1
  %115 = fsub double %105, %113
  %116 = fsub double %115, %114
  %exitcond101.3 = icmp eq i64 %indvars.iv.next93.2, %wide.trip.count100
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond101.3, label %._crit_edge13.loopexit.unr-lcssa, label %.lr.ph12

._crit_edge13.loopexit.unr-lcssa:                 ; preds = %.lr.ph12
  br label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %.lr.ph12.prol.loopexit, %._crit_edge13.loopexit.unr-lcssa
  %.lcssa156 = phi double [ %.lcssa156.unr, %.lr.ph12.prol.loopexit ], [ %116, %._crit_edge13.loopexit.unr-lcssa ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %80
  %.lcssa1624 = phi double [ %84, %80 ], [ %.lcssa156, %._crit_edge13.loopexit ]
  %117 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  store double %.lcssa1624, double* %117, align 8
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %118 = icmp slt i64 %indvars.iv.next103, %8
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  br i1 %118, label %80, label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge13
  %119 = add nsw i64 %wide.trip.count120, 1
  br label %120

; <label>:120:                                    ; preds = %._crit_edge._crit_edge, %._crit_edge73
  %indvar = phi i32 [ %indvar.next, %._crit_edge._crit_edge ], [ 0, %._crit_edge73 ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge._crit_edge ], [ %wide.trip.count120, %._crit_edge73 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge._crit_edge ], [ %0, %._crit_edge73 ]
  %121 = sub i32 %0, %indvar
  %122 = sext i32 %121 to i64
  %123 = sub nsw i64 %wide.trip.count120, %122
  %124 = getelementptr inbounds double, double* %4, i64 %indvars.iv90
  %125 = load double, double* %124, align 8
  %126 = add nsw i64 %indvars.iv90, 1
  %127 = icmp slt i64 %126, %8
  br i1 %127, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %120
  %128 = sub nsw i64 %119, %122
  %129 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %128, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %130

; <label>:130:                                    ; preds = %130, %.prol.preheader
  %indvars.iv88.prol = phi i64 [ %indvars.iv.next89.prol, %130 ], [ %129, %.prol.preheader ]
  %131 = phi double [ %137, %130 ], [ %125, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %130 ], [ %xtraiter, %.prol.preheader ]
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88.prol
  %133 = load double, double* %132, align 8
  %134 = getelementptr inbounds double, double* %3, i64 %indvars.iv88.prol
  %135 = load double, double* %134, align 8
  %136 = fmul double %133, %135
  %137 = fsub double %131, %136
  %indvars.iv.next89.prol = add nsw i64 %indvars.iv88.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %130, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %130
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %137, %.prol.loopexit.unr-lcssa ]
  %indvars.iv88.unr = phi i64 [ %129, %.lr.ph ], [ %indvars.iv.next89.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %125, %.lr.ph ], [ %137, %.prol.loopexit.unr-lcssa ]
  %138 = icmp ult i64 %123, 3
  br i1 %138, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %139

; <label>:139:                                    ; preds = %139, %.lr.ph.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr, %.lr.ph.new ], [ %indvars.iv.next89.3, %139 ]
  %140 = phi double [ %.unr, %.lr.ph.new ], [ %162, %139 ]
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88
  %142 = bitcast double* %141 to <2 x double>*
  %143 = getelementptr inbounds double, double* %3, i64 %indvars.iv88
  %144 = bitcast double* %143 to <2 x double>*
  %145 = load <2 x double>, <2 x double>* %142, align 8
  %146 = load <2 x double>, <2 x double>* %144, align 8
  %147 = fmul <2 x double> %145, %146
  %148 = extractelement <2 x double> %147, i32 0
  %149 = extractelement <2 x double> %147, i32 1
  %150 = fsub double %140, %148
  %151 = fsub double %150, %149
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv.next89.1
  %153 = bitcast double* %152 to <2 x double>*
  %154 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next89.1
  %155 = bitcast double* %154 to <2 x double>*
  %indvars.iv.next89.2 = add nsw i64 %indvars.iv88, 3
  %156 = load <2 x double>, <2 x double>* %153, align 8
  %157 = load <2 x double>, <2 x double>* %155, align 8
  %158 = fmul <2 x double> %156, %157
  %159 = extractelement <2 x double> %158, i32 0
  %160 = extractelement <2 x double> %158, i32 1
  %161 = fsub double %151, %159
  %162 = fsub double %161, %160
  %exitcond.3 = icmp eq i64 %indvars.iv.next89.2, %wide.trip.count120
  %indvars.iv.next89.3 = add nsw i64 %indvars.iv88, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %139

._crit_edge.loopexit.unr-lcssa:                   ; preds = %139
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %162, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %120
  %.lcssa210 = phi double [ %125, %120 ], [ %.lcssa, %._crit_edge.loopexit ]
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv90
  %164 = load double, double* %163, align 8
  %165 = fdiv double %.lcssa210, %164
  %166 = getelementptr inbounds double, double* %3, i64 %indvars.iv90
  store double %165, double* %166, align 8
  %167 = icmp sgt i64 %indvars.iv90, 0
  br i1 %167, label %._crit_edge._crit_edge, label %._crit_edge76.loopexit

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvars.iv.next91 = add i64 %indvars.iv90, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %120

._crit_edge76.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge57.._crit_edge76_crit_edge, %._crit_edge76.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge3, label %._crit_edge1.loopexit

._crit_edge1.loopexit:                            ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !2}
