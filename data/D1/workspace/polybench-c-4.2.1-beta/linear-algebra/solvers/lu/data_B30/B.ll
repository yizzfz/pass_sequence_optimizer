; ModuleID = 'A.ll'
source_filename = "lu.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.preheader15.lr.ph:
  br label %.lr.ph54

.lr.ph54:                                         ; preds = %._crit_edge61, %.preheader15.lr.ph
  %indvars.iv4 = phi i3 [ %indvars.iv.next5, %._crit_edge61 ], [ -1, %.preheader15.lr.ph ]
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %._crit_edge61 ], [ 1, %.preheader15.lr.ph ]
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %._crit_edge61 ], [ 0, %.preheader15.lr.ph ]
  %1 = zext i3 %indvars.iv4 to i64
  %2 = add i64 %indvars.iv2, %1
  %3 = sub nuw nsw i64 1999, %indvars.iv127
  br label %4

; <label>:4:                                      ; preds = %4, %.lr.ph54
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %4 ], [ 0, %.lr.ph54 ]
  %5 = sub nsw i64 0, %indvars.iv115
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv115
  store double %10, double* %11, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next116, %indvars.iv2
  br i1 %exitcond119, label %._crit_edge55, label %4

._crit_edge55:                                    ; preds = %4
  %12 = sub nsw i64 1998, %indvars.iv127
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %13 = icmp slt i64 %indvars.iv.next128, 2000
  br i1 %13, label %.lr.ph60, label %._crit_edge61

.lr.ph60:                                         ; preds = %._crit_edge55
  %xtraiter = and i64 %3, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph60
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv122.prol = phi i64 [ %indvars.iv.next123.prol, %.prol.preheader ], [ %indvars.iv2, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv122.prol
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next123.prol = add nuw nsw i64 %indvars.iv122.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph60
  %indvars.iv122.unr = phi i64 [ %indvars.iv2, %.lr.ph60 ], [ %2, %.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %12, 7
  br i1 %15, label %._crit_edge61, label %.lr.ph60.new.preheader

.lr.ph60.new.preheader:                           ; preds = %.prol.loopexit
  %16 = sub i64 1992, %indvars.iv122.unr
  %17 = lshr i64 %16, 3
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 2
  br i1 %min.iters.check, label %.lr.ph60.new.preheader1, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph60.new.preheader
  %n.mod.vf = and i64 %18, 1
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = add i64 %indvars.iv122.unr, 8
  %20 = shl nuw i64 %17, 3
  %21 = add i64 %19, %20
  %22 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph60.new.preheader1, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %23 = shl i64 %index, 3
  %24 = add i64 %indvars.iv122.unr, %23
  %25 = add nsw i64 %24, 7
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %25
  %27 = getelementptr double, double* %26, i64 -7
  %28 = bitcast double* %27 to <16 x double>*
  store <16 x double> zeroinitializer, <16 x double>* %28, align 8
  %index.next = add i64 %index, 2
  %29 = icmp eq i64 %index.next, %n.vec
  br i1 %29, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge61, label %.lr.ph60.new.preheader1

.lr.ph60.new.preheader1:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph60.new.preheader
  %indvars.iv122.ph = phi i64 [ %indvars.iv122.unr, %min.iters.checked ], [ %indvars.iv122.unr, %.lr.ph60.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph60.new

.lr.ph60.new:                                     ; preds = %.lr.ph60.new.preheader1, %.lr.ph60.new
  %indvars.iv122 = phi i64 [ %indvars.iv.next123.7, %.lr.ph60.new ], [ %indvars.iv122.ph, %.lr.ph60.new.preheader1 ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv122
  store double 0.000000e+00, double* %30, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv.next123
  store double 0.000000e+00, double* %31, align 8
  %indvars.iv.next123.1 = add nsw i64 %indvars.iv122, 2
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv.next123.1
  store double 0.000000e+00, double* %32, align 8
  %indvars.iv.next123.2 = add nsw i64 %indvars.iv122, 3
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv.next123.2
  store double 0.000000e+00, double* %33, align 8
  %indvars.iv.next123.3 = add nsw i64 %indvars.iv122, 4
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv.next123.3
  store double 0.000000e+00, double* %34, align 8
  %indvars.iv.next123.4 = add nsw i64 %indvars.iv122, 5
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv.next123.4
  store double 0.000000e+00, double* %35, align 8
  %indvars.iv.next123.5 = add nsw i64 %indvars.iv122, 6
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv.next123.5
  store double 0.000000e+00, double* %36, align 8
  %indvars.iv.next123.6 = add nsw i64 %indvars.iv122, 7
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv.next123.6
  store double 0.000000e+00, double* %37, align 8
  %indvars.iv.next123.7 = add nsw i64 %indvars.iv122, 8
  %exitcond124.7 = icmp eq i64 %indvars.iv.next123.7, 2000
  br i1 %exitcond124.7, label %._crit_edge61.loopexit, label %.lr.ph60.new, !llvm.loop !6

._crit_edge61.loopexit:                           ; preds = %.lr.ph60.new
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61.loopexit, %middle.block, %.prol.loopexit, %._crit_edge55
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv127
  store double 1.000000e+00, double* %38, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next128, 2000
  %indvars.iv.next5 = add i3 %indvars.iv4, -1
  br i1 %exitcond129, label %.preheader12.us.preheader, label %.lr.ph54

.preheader12.us.preheader:                        ; preds = %._crit_edge61
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 32000000, i32 8, i1 false)
  %40 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader11.us.us.preheader

.preheader11.us.us.preheader:                     ; preds = %._crit_edge27.us, %.preheader12.us.preheader
  %indvars.iv103 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next104, %._crit_edge27.us ]
  br label %.preheader11.us.us

._crit_edge27.us:                                 ; preds = %._crit_edge25.us.us
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond105, label %.preheader.us.preheader, label %.preheader11.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge27.us
  %41 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader11.us.us:                               ; preds = %._crit_edge25.us.us, %.preheader11.us.us.preheader
  %indvars.iv100 = phi i64 [ 0, %.preheader11.us.us.preheader ], [ %indvars.iv.next101, %._crit_edge25.us.us ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv100, i64 %indvars.iv103
  br label %43

._crit_edge25.us.us:                              ; preds = %43
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next101, 2000
  br i1 %exitcond102, label %._crit_edge27.us, label %.preheader11.us.us

; <label>:43:                                     ; preds = %43, %.preheader11.us.us
  %indvars.iv97 = phi i64 [ 0, %.preheader11.us.us ], [ %indvars.iv.next98.1, %43 ]
  %44 = load double, double* %42, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv103
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv100, i64 %indvars.iv97
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  store double %50, double* %48, align 8
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %51 = load double, double* %42, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next98, i64 %indvars.iv103
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next98
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  store double %57, double* %55, align 8
  %indvars.iv.next98.1 = add nuw nsw i64 %indvars.iv97, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next98.1, 2000
  br i1 %exitcond99.1, label %._crit_edge25.us.us, label %43

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %58

; <label>:58:                                     ; preds = %58, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.4, %58 ]
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv92, i64 %indvars.iv
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv.next
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %75 = bitcast double* %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.3
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv.next.3
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge.us, label %58

._crit_edge.us:                                   ; preds = %58
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next93, 2000
  br i1 %exitcond94, label %84, label %.preheader.us

; <label>:84:                                     ; preds = %._crit_edge.us
  tail call void @free(i8* %39) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.preheader, label %._crit_edge21

.preheader6.preheader:                            ; preds = %2
  %wide.trip.count64 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %._crit_edge16
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge16 ], [ 0, %.preheader6.preheader ]
  %4 = icmp sgt i64 %indvars.iv66, 0
  br i1 %4, label %.preheader5.preheader, label %._crit_edge16

.preheader5.preheader:                            ; preds = %.preheader6
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 0
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %._crit_edge
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %6 = icmp sgt i64 %indvars.iv44, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv44
  %.pre = load double, double* %7, align 8
  br i1 %6, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %xtraiter = and i64 %indvars.iv44, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %8

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load double, double* %5, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv44
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %.pre, %12
  store double %13, double* %7, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %8
  %indvars.iv.unr.ph = phi i64 [ 1, %8 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %13, %8 ], [ %.pre, %.lr.ph ]
  %.lcssa37.unr.ph = phi double [ %13, %8 ], [ undef, %.lr.ph ]
  %14 = icmp eq i64 %indvars.iv44, 1
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %15 = phi double [ %27, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv44
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv44
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %7, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv44
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader5, %.prol.loopexit
  %28 = phi double [ %.lcssa37.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader5 ], [ %27, %._crit_edge.loopexit ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv44, i64 %indvars.iv44
  %30 = load double, double* %29, align 8
  %31 = fdiv double %28, %30
  store double %31, double* %7, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next45, %indvars.iv66
  br i1 %exitcond49, label %.preheader.us.preheader, label %.preheader5

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter72 = and i64 %indvars.iv66, 1
  %32 = icmp eq i64 %xtraiter72, 0
  %33 = icmp eq i64 %indvars.iv66, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge13.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge13.us ], [ %indvars.iv66, %.preheader.us.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv60
  %.pre33 = load double, double* %34, align 8
  br i1 %32, label %.prol.loopexit71, label %35

; <label>:35:                                     ; preds = %.preheader.us
  %36 = load double, double* %5, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv60
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %.pre33, %39
  store double %40, double* %34, align 8
  br label %.prol.loopexit71

.prol.loopexit71:                                 ; preds = %.preheader.us, %35
  %indvars.iv51.unr.ph = phi i64 [ 1, %35 ], [ 0, %.preheader.us ]
  %.unr74.ph = phi double [ %40, %35 ], [ %.pre33, %.preheader.us ]
  br i1 %33, label %._crit_edge13.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit71
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %.preheader.us.new ], [ %indvars.iv51.unr.ph, %.preheader.us.new.preheader ]
  %41 = phi double [ %53, %.preheader.us.new ], [ %.unr74.ph, %.preheader.us.new.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv51
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv60
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %34, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv.next52
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next52, i64 %indvars.iv60
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  store double %53, double* %34, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next52.1, %indvars.iv66
  br i1 %exitcond57.1, label %._crit_edge13.us.loopexit, label %.preheader.us.new

._crit_edge13.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit71
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next61, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader6
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count64
  br i1 %exitcond69, label %._crit_edge21.loopexit, label %.preheader6

._crit_edge21.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge3

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %9 = mul nsw i64 %8, %indvars.iv8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count
  br i1 %exitcond11, label %._crit_edge3.loopexit, label %.preheader.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
