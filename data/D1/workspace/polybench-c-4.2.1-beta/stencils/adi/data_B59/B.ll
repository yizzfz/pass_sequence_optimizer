; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %2 = add nuw nsw i64 %indvars.iv12, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  store double %7, double* %8, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = sub nuw nsw i64 %2, %indvars.iv.next
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %12, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
.preheader128.lr.ph:
  br label %.lr.ph135.split.us.preheader

.lr.ph135.split.us.preheader:                     ; preds = %._crit_edge146, %.preheader128.lr.ph
  %storemerge147 = phi i32 [ 1, %.preheader128.lr.ph ], [ %160, %._crit_edge146 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge133.us, %.lr.ph135.split.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge133.us ], [ 0, %.lr.ph135.split.us.preheader ]
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %._crit_edge133.us ], [ 1, %.lr.ph135.split.us.preheader ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep164 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep166 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep168 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv151
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv151, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv151
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv151, -1
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %bound0 = icmp ult double* %scevgep, %scevgep168
  %bound1 = icmp ult double* %scevgep166, %scevgep164
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv151, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 0xC09F400000000001
  %19 = fadd double %18, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.lver.orig
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, 0xC08F400000000001
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv151
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, 0xC09F3C0000000001
  %28 = fsub double %27, %24
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next152
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %28, %31
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv151, i64 %15
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %32, %35
  %37 = load double, double* %16, align 8
  %38 = fmul double %37, 0xC09F400000000001
  %39 = fadd double %38, 0x40AF420000000001
  %40 = fdiv double %36, %39
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv151, i64 %indvars.iv.lver.orig
  store double %40, double* %41, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.lr.ph132.us.preheader.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep170 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %scevgep173 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %load_initial = load double, double* %scevgep170, align 8
  %load_initial174 = load double, double* %scevgep173, align 8
  br label %60

._crit_edge133.us:                                ; preds = %.lr.ph132.us
  %exitcond153 = icmp eq i64 %indvars.iv.next152, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond153, label %.lver.check190.preheader, label %.lver.check

.lver.check190.preheader:                         ; preds = %._crit_edge133.us
  br label %.lver.check190

.lr.ph132.us:                                     ; preds = %.lr.ph132.us, %.lr.ph132.us.preheader
  %indvars.iv149 = phi i64 [ 998, %.lr.ph132.us.preheader ], [ %indvars.iv.next150.1, %.lr.ph132.us ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv149
  %43 = load double, double* %42, align 8
  %44 = or i64 %indvars.iv149, 1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %44, i64 %indvars.iv151
  %46 = load double, double* %45, align 8
  %47 = fmul double %43, %46
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv151, i64 %indvars.iv149
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv149, i64 %indvars.iv151
  store double %50, double* %51, align 8
  %indvars.iv.next150 = add nsw i64 %indvars.iv149, -1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv.next150
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %50
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv151, i64 %indvars.iv.next150
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next150, i64 %indvars.iv151
  store double %57, double* %58, align 8
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, -2
  %59 = icmp sgt i64 %indvars.iv.next150, 1
  br i1 %59, label %.lr.ph132.us, label %._crit_edge133.us

; <label>:60:                                     ; preds = %60, %.ph
  %store_forwarded175 = phi double [ %load_initial174, %.ph ], [ %80, %60 ]
  %store_forwarded172 = phi double [ %load_initial, %.ph ], [ %63, %60 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %60 ]
  %61 = fmul double %store_forwarded172, 0xC09F400000000001
  %62 = fadd double %61, 0x40AF420000000001
  %63 = fdiv double 0x409F400000000001, %62
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv151, i64 %indvars.iv
  store double %63, double* %64, align 8
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, 0xC08F400000000001
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv151
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, 0xC09F3C0000000001
  %71 = fsub double %70, %67
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next152
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, 0xC08F400000000001
  %75 = fsub double %71, %74
  %76 = fmul double %store_forwarded175, 0xC09F400000000001
  %77 = fsub double %75, %76
  %78 = fmul double %store_forwarded172, 0xC09F400000000001
  %79 = fadd double %78, 0x40AF420000000001
  %80 = fdiv double %77, %79
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv151, i64 %indvars.iv
  store double %80, double* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.lr.ph132.us.preheader.loopexit201, label %60

.lr.ph132.us.preheader.loopexit:                  ; preds = %.ph.lver.orig
  br label %.lr.ph132.us.preheader

.lr.ph132.us.preheader.loopexit201:               ; preds = %60
  br label %.lr.ph132.us.preheader

.lr.ph132.us.preheader:                           ; preds = %.lr.ph132.us.preheader.loopexit201, %.lr.ph132.us.preheader.loopexit
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv151
  store double 1.000000e+00, double* %82, align 8
  br label %.lr.ph132.us

.lver.check190:                                   ; preds = %.lver.check190.preheader, %._crit_edge143.us
  %indvar176 = phi i64 [ %indvar.next177, %._crit_edge143.us ], [ 0, %.lver.check190.preheader ]
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge143.us ], [ 1, %.lver.check190.preheader ]
  %83 = add i64 %indvar176, 1
  %84 = add i64 %indvar176, 1
  %scevgep178 = getelementptr [1000 x double], [1000 x double]* %4, i64 %84, i64 0
  %scevgep180 = getelementptr [1000 x double], [1000 x double]* %4, i64 %84, i64 999
  %scevgep182 = getelementptr [1000 x double], [1000 x double]* %5, i64 %84, i64 0
  %scevgep184 = getelementptr [1000 x double], [1000 x double]* %5, i64 %84, i64 999
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv159, i64 0
  store double 1.000000e+00, double* %85, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv159, i64 0
  store double 0.000000e+00, double* %86, align 8
  %87 = bitcast double* %85 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv159
  %90 = bitcast [1000 x double]* %89 to i64*
  store i64 %88, i64* %90, align 8
  %91 = add nsw i64 %indvars.iv159, -1
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %bound0186 = icmp ult double* %scevgep178, %scevgep184
  %bound1187 = icmp ult double* %scevgep182, %scevgep180
  %memcheck.conflict189 = and i1 %bound0186, %bound1187
  br i1 %memcheck.conflict189, label %.ph191.lver.orig.preheader, label %.ph191

.ph191.lver.orig.preheader:                       ; preds = %.lver.check190
  br label %.ph191.lver.orig

.ph191.lver.orig:                                 ; preds = %.ph191.lver.orig.preheader, %.ph191.lver.orig
  %indvars.iv154.lver.orig = phi i64 [ %indvars.iv.next155.lver.orig, %.ph191.lver.orig ], [ 1, %.ph191.lver.orig.preheader ]
  %92 = add nsw i64 %indvars.iv154.lver.orig, -1
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv159, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, 0xC08F400000000001
  %96 = fadd double %95, 0x409F440000000001
  %97 = fdiv double 0x408F400000000001, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv159, i64 %indvars.iv154.lver.orig
  store double %97, double* %98, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %91, i64 %indvars.iv154.lver.orig
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv159, i64 %indvars.iv154.lver.orig
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, 0xC0AF3E0000000001
  %105 = fsub double %104, %101
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next160, i64 %indvars.iv154.lver.orig
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, 0xC09F400000000001
  %109 = fsub double %105, %108
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv159, i64 %92
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, 0xC08F400000000001
  %113 = fsub double %109, %112
  %114 = load double, double* %93, align 8
  %115 = fmul double %114, 0xC08F400000000001
  %116 = fadd double %115, 0x409F440000000001
  %117 = fdiv double %113, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv159, i64 %indvars.iv154.lver.orig
  store double %117, double* %118, align 8
  %indvars.iv.next155.lver.orig = add nuw nsw i64 %indvars.iv154.lver.orig, 1
  %exitcond156.lver.orig = icmp eq i64 %indvars.iv.next155.lver.orig, 999
  br i1 %exitcond156.lver.orig, label %.lr.ph142.us.preheader.loopexit, label %.ph191.lver.orig

.ph191:                                           ; preds = %.lver.check190
  %scevgep192 = getelementptr [1000 x double], [1000 x double]* %4, i64 %83, i64 0
  %scevgep197 = getelementptr [1000 x double], [1000 x double]* %5, i64 %83, i64 0
  %load_initial193 = load double, double* %scevgep192, align 8
  %load_initial198 = load double, double* %scevgep197, align 8
  br label %137

._crit_edge143.us:                                ; preds = %.lr.ph142.us
  %exitcond161 = icmp eq i64 %indvars.iv.next160, 999
  %indvar.next177 = add i64 %indvar176, 1
  br i1 %exitcond161, label %._crit_edge146, label %.lver.check190

.lr.ph142.us:                                     ; preds = %.lr.ph142.us, %.lr.ph142.us.preheader
  %indvars.iv157 = phi i64 [ 998, %.lr.ph142.us.preheader ], [ %indvars.iv.next158.1, %.lr.ph142.us ]
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv159, i64 %indvars.iv157
  %120 = load double, double* %119, align 8
  %121 = or i64 %indvars.iv157, 1
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv159, i64 %121
  %123 = load double, double* %122, align 8
  %124 = fmul double %120, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv159, i64 %indvars.iv157
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv159, i64 %indvars.iv157
  store double %127, double* %128, align 8
  %indvars.iv.next158 = add nsw i64 %indvars.iv157, -1
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv159, i64 %indvars.iv.next158
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %127
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv159, i64 %indvars.iv.next158
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv159, i64 %indvars.iv.next158
  store double %134, double* %135, align 8
  %indvars.iv.next158.1 = add nsw i64 %indvars.iv157, -2
  %136 = icmp sgt i64 %indvars.iv.next158, 1
  br i1 %136, label %.lr.ph142.us, label %._crit_edge143.us

; <label>:137:                                    ; preds = %137, %.ph191
  %store_forwarded199 = phi double [ %load_initial198, %.ph191 ], [ %157, %137 ]
  %store_forwarded196 = phi double [ %load_initial193, %.ph191 ], [ %140, %137 ]
  %indvars.iv154 = phi i64 [ 1, %.ph191 ], [ %indvars.iv.next155, %137 ]
  %138 = fmul double %store_forwarded196, 0xC08F400000000001
  %139 = fadd double %138, 0x409F440000000001
  %140 = fdiv double 0x408F400000000001, %139
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv159, i64 %indvars.iv154
  store double %140, double* %141, align 8
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %91, i64 %indvars.iv154
  %143 = load double, double* %142, align 8
  %144 = fmul double %143, 0xC09F400000000001
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv159, i64 %indvars.iv154
  %146 = load double, double* %145, align 8
  %147 = fmul double %146, 0xC0AF3E0000000001
  %148 = fsub double %147, %144
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next160, i64 %indvars.iv154
  %150 = load double, double* %149, align 8
  %151 = fmul double %150, 0xC09F400000000001
  %152 = fsub double %148, %151
  %153 = fmul double %store_forwarded199, 0xC08F400000000001
  %154 = fsub double %152, %153
  %155 = fmul double %store_forwarded196, 0xC08F400000000001
  %156 = fadd double %155, 0x409F440000000001
  %157 = fdiv double %154, %156
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv159, i64 %indvars.iv154
  store double %157, double* %158, align 8
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond156 = icmp eq i64 %indvars.iv.next155, 999
  br i1 %exitcond156, label %.lr.ph142.us.preheader.loopexit200, label %137

.lr.ph142.us.preheader.loopexit:                  ; preds = %.ph191.lver.orig
  br label %.lr.ph142.us.preheader

.lr.ph142.us.preheader.loopexit200:               ; preds = %137
  br label %.lr.ph142.us.preheader

.lr.ph142.us.preheader:                           ; preds = %.lr.ph142.us.preheader.loopexit200, %.lr.ph142.us.preheader.loopexit
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv159, i64 999
  store double 1.000000e+00, double* %159, align 8
  br label %.lr.ph142.us

._crit_edge146:                                   ; preds = %._crit_edge143.us
  %160 = add nuw nsw i32 %storemerge147, 1
  %exitcond162 = icmp eq i32 %160, 501
  br i1 %exitcond162, label %._crit_edge148, label %.lr.ph135.split.us.preheader

._crit_edge148:                                   ; preds = %._crit_edge146
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv12, 1000
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
